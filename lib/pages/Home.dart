import 'package:flutter/material.dart';
import '../widgets/CustomAppBar.dart';
import '../pages/YourReading.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedPage = 0;

  static List<Widget> _pages = <Widget>[
    YourReading(),
    Text("Reading"),
    Text("Explore"),
    Text("User"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Liv - Reading Tracker"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: SafeArea(
          child: _pages.elementAt(_selectedPage),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Reading',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedPage,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
