import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/reviews.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String _playerResponse = '';
  String _selectedLineUp = '';
  String _gameScore = '';
  String _playerOfTheMatch = '';
  int _playerRating = 0;

  void _askAvailability() {
    // Your existing code for asking availability
  }

  void _requestLineUp() {
    // Your existing code for requesting line up
  }

  void _showGameScore() {
    setState(() {
      _gameScore = 'Game score: 3-2';
    });
  }

  void _requestPlayerOfTheMatchVote() {
    // Your existing code for requesting player of the match vote
  }

  void _requestPlayerRating() {
    // Your existing code for requesting player rating
  }

  void _navigateToReviews() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Reviews()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPlayerAvailability(),
            SizedBox(height: 16),
            _buildSelectedLineUp(),
            SizedBox(height: 16),
            _buildGameScore(),
            SizedBox(height: 16),
            _buildPlayerOfTheMatch(),
            SizedBox(height: 16),
            _buildPlayerRating(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToReviews,
              child: Text('View Reviews'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerAvailability() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Player Availability:'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: _askAvailability,
          child: Text('Ask Availability'),
        ),
      ],
    );
  }

  Widget _buildSelectedLineUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selected Line Up:'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: _requestLineUp,
          child: Text('Request Line Up'),
        ),
      ],
    );
  }

  Widget _buildGameScore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Game Score:'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: _showGameScore,
          child: Text('Show Score'),
        ),
      ],
    );
  }

  Widget _buildPlayerOfTheMatch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Player of the Match:'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: _requestPlayerOfTheMatchVote,
          child: Text('Request Vote'),
        ),
      ],
    );
  }

  Widget _buildPlayerRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Player Rating:'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: _requestPlayerRating,
          child: Text('Request Rating'),
        ),
      ],
    );
  }
}
