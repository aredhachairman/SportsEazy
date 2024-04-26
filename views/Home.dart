import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/notifications.dart';
import 'package:flutter_application_1/views/reviews.dart';
import 'package:flutter_application_1/views/standings.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedPage = 0.obs;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Dashboard(),
    Reviews(),
    Standings(),
    Notifications(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }

Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    } else {
      bool? wantToLogout = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Do you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          );
        },
      );
      if (wantToLogout ?? false) {
        // Handle logout logic here
        return true;
      } else {
        return false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        persistentFooterAlignment: AlignmentDirectional.center,
        appBar: AppBar(
          title: Text("TEAM MANAGER"),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 130, 24, 24)),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rate_review,
                  color: Color.fromARGB(255, 130, 24, 24)),
              label: 'Reviews',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart,
                  color: Color.fromARGB(255, 130, 24, 24)),
              label: 'Standings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications,
                  color: Color.fromARGB(255, 130, 24, 24)),
              label: 'Notifications',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 130, 24, 24),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
