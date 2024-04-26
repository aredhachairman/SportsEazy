import 'package:flutter/material.dart';

class Team {
  Team(
      {required this.name,
      required this.points,
      required this.played,
      required this.goalsDifference});

  final String name;
  final int points;
  final int played;
  final int goalsDifference;

  int get goalsFor => (points / 3 + goalsDifference / 2).round();
  int get goalsAgainst => goalsDifference ~/ 2;
}

class Standings extends StatefulWidget {
  const Standings({Key? key}) : super(key: key);

  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  List<Team> _teams = [
    Team(name: 'Manchester City', points: 83, played: 38, goalsDifference: 67),
    Team(name: 'Liverpool', points: 82, played: 38, goalsDifference: 68),
    Team(name: 'Chelsea', points: 71, played: 38, goalsDifference: 39),
    Team(name: 'Tottenham', points: 62, played: 38, goalsDifference: 26),
    Team(name: 'Arsenal', points: 61, played: 38, goalsDifference: 13),
    Team(
        name: 'Manchester United', points: 58, played: 38, goalsDifference: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 240, 241, 1),
      appBar: AppBar(
        title: Text('Standings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Position',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Team',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Played',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Points',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: _teams
                .asMap()
                .map((index, team) => MapEntry(
                      index,
                      DataRow(
                        color:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.08);
                          }
                          if (index % 2 == 0) {
                            return Color.fromARGB(255, 134, 9, 30);
                          } else {
                            return const Color.fromARGB(255, 213, 83, 83);
                          }
                        }),
                        cells: <DataCell>[
                          DataCell(Text('${index + 1}')),
                          DataCell(Text(team.name)),
                          DataCell(Text(team.played.toString())),
                          DataCell(Text(team.points.toString())),
                        ],
                      ),
                    ))
                .values
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateTable,
        child: Icon(Icons.refresh),
      ),
    );
  }

  void _updateTable() {
    setState(() {
      _teams.add(
          Team(name: 'New Team', points: 50, played: 30, goalsDifference: 20));
    });
  }
}
