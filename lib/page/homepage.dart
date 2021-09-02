import 'package:flutter/material.dart';
import 'package:startup_namer/page/coursepage.dart';
import 'package:startup_namer/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    RandomCourses(amount: 9),
    RandomCourses(amount: 15),
    RandomCourses(),
    RandomCourses(amount: 30),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const HeaderWidget(),
            Expanded(
              // child: _widgetOptions.elementAt(_selectedIndex),
              child: IndexedStack(
                index: _selectedIndex,
                children: _widgetOptions,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: 'All', icon: Icon(Icons.all_inclusive)),
            BottomNavigationBarItem(
                label: 'Course', icon: Icon(Icons.cases_rounded)),
            BottomNavigationBarItem(
                label: 'ONS', icon: Icon(Icons.play_circle)),
            BottomNavigationBarItem(
                label: 'Fast', icon: Icon(Icons.offline_bolt)),
          ],
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: Colors.teal[300],
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
        ));
  }
}
