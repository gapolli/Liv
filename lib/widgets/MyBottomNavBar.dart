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
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
      currentIndex: _selectedPage,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        color: Colors.black,
      ),
      showUnselectedLabels: true,
      onTap: _onItemTapped,
      backgroundColor: Color.fromRGBO(150, 140, 131, 1),
    );
  }
}
