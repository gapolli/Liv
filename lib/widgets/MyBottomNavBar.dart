import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar(
      {Key key, @required int selectedPage, @required Function onItemTapped})
      : _onItemTapped = onItemTapped,
        _selectedPage = selectedPage,
        super(key: key);

  final Function _onItemTapped;
  final int _selectedPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
