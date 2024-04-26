import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/customtext.dart';
import 'package:flutter_application_1/views/standings.dart';

class Dashboard extends StatefulWidget {
  @override
  _SportsDashboardState createState() => _SportsDashboardState();
}

class _SportsDashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _navigateToStandings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Standings()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(88, 8, 30, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CustomText(
                label: 'Welcome to the Sports Dashboard',
                fontsize: 25,
                labelcolor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Upcoming Games'),
                Tab(text: 'Past Games'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildGamesList(
                      upcomingGames: ['Game 1', 'Game 2', 'Game 3']),
                  _buildGamesList(
                      upcomingGames: ['Game 4', 'Game 5', 'Game 6']),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToStandings,
              child: Text('View Standings'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGamesList({required List<String> upcomingGames}) {
    return ListView.builder(
      itemCount: upcomingGames.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(upcomingGames[index]),
          tileColor: Colors.white,
        );
      },
    );
  }
}