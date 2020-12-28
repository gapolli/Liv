import 'package:flutter/material.dart';
import './widgets/CustomAppBar.dart';
import './widgets/MyBottomNavBar.dart';
import './pages/Home.dart';
import './pages/CurrentlyReading.dart';
import './pages/Search.dart';

class ReadingTracker extends StatefulWidget {
  ReadingTracker({Key key}) : super(key: key);

  @override
  _ReadingTracker createState() => _ReadingTracker();
}

class _ReadingTracker extends State<ReadingTracker> {
  static const String _title = 'Liv - Reading Tracker';
  int _selectedPage = 0;

  List<Widget> _pages = <Widget>[Home(), CurrentlyReading(), Search()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: _title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: _pages.elementAt(_selectedPage),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onItemTapped: _onItemTapped,
        selectedPage: _selectedPage,
      ),
    );
  }
}
