import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Player {
  final String name;
  final String imageUrl;
  int votes;
  double rating;

  Player({
    required this.name,
    required this.imageUrl,
    this.votes = 0,
    this.rating = 0,
  });
}

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  List<Player> _players = [
    Player(name: 'Player 1', imageUrl: 'https://example.com/player1.png'),
    Player(name: 'Player 2', imageUrl: 'https://example.com/player2.png'),
    // Add more players...
  ];
  Player? _playerOfTheMatch;
  double _playerRating = 0;

  void _incrementPlayerVote(Player player) {
    setState(() {
      player.votes++;
      _updatePlayerOfTheMatch();
    });
  }

  void _updatePlayerOfTheMatch() {
    setState(() {
      _playerOfTheMatch =
          _players.reduce((a, b) => a.rating > b.rating ? a : b);
    });
  }

  void _updatePlayerRating(double newRating) {
    setState(() {
      _playerRating = newRating;
    });
  }

  void _sortPlayersByRating() {
    setState(() {
      _players.sort((a, b) => b.rating.compareTo(a.rating));
    });
  }

  void _showVoteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Vote for Player of the Match'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: _players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(_players[index].imageUrl)),
                  title: Text(_players[index].name),
                  onTap: () {
                    _incrementPlayerVote(_players[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rate Players'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: _players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(_players[index].imageUrl)),
                  title: Text(_players[index].name),
                  trailing: RatingBar.builder(
                    initialRating: _players[index].rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 10,
                    itemSize: 30,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _players[index].rating = rating;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _sortPlayersByRating();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Player of the match:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            _buildPlayerOfTheMatchWidget(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showVoteDialog,
              child: Text('Vote for Player of the Match'),
            ),
            SizedBox(height: 32),
            Text(
              'Rate the players:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showRatingDialog,
              child: Text('Rate Players'),
            ),
            SizedBox(height: 32),
            _buildAverageRatingsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerOfTheMatchWidget() {
    if (_playerOfTheMatch != null) {
      return Text(
        'Current Player of the Match: ${_playerOfTheMatch!.name}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );
    } else {
      return GestureDetector(
        onTap: _showVoteDialog,
        child: Text(
          'No Player has been voted for yet. Tap here to vote.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget _buildAverageRatingsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Average Ratings:',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _showRatingDialog,
          child: Text('Sort by rating'),
        ),
        SizedBox(height: 16),
        _buildSortedPlayerList(),
      ],
    );
  }

  Widget _buildSortedPlayerList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _players.map((player) {
        return Column(
          key: UniqueKey(),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading:
                  CircleAvatar(backgroundImage: NetworkImage(player.imageUrl)),
              title: Text(player.name),
              trailing: Text(
                player.rating.toStringAsFixed(1),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
          ],
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Reviews(),
  ));
}
