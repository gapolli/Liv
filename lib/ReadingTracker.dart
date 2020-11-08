import 'package:flutter/material.dart';
import 'package:liv_reading_tracker/pages/CurrentlyReading.dart';
import 'package:liv_reading_tracker/pages/Explore.dart';
import 'package:liv_reading_tracker/pages/Home.dart';
import 'package:liv_reading_tracker/pages/User.dart';
import 'package:liv_reading_tracker/widgets/CustomAppBar.dart';
import 'package:liv_reading_tracker/widgets/MyBottomNavBar.dart';

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
    CurrentlyReading(),
    Explore(),
    User(),
  ];

  void _onItemTapped(int index) {
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
      bottomNavigationBar: MyBottomNavBar(
        onItemTapped: _onItemTapped,
        selectedPage: _selectedPage,
      ),
    );
  }
}
