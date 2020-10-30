import 'package:flutter/material.dart';
import './widgets/CustomAppBar.dart';
import './pages/Home.dart';

class ReadingTracker extends StatefulWidget {
  ReadingTracker({Key key}) : super(key: key);

  @override
  _ReadingTracker createState() => _ReadingTracker();
}

class _ReadingTracker extends State<ReadingTracker> {
  static const String _title = 'Liv - Reading Tracker';
  int _selectedPage = 0;

  List<Widget> _pages = <Widget>[
    Home(),
    Text("Reading"),
    Text("Explore"),
    Text("User"),
  ];

  void _onItemTapped(int index) {
    print("Apertou essa porra");
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title,
      ),
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
