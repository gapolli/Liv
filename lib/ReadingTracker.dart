import 'package:flutter/material.dart';
import './pages/Home.dart';
import './pages/SignUp.dart';

class ReadingTracker extends StatelessWidget {
  static const String _title = 'Liv - Reading Tracker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
