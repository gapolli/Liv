import 'package:flutter/material.dart';
import './ReadingTracker.dart';
import './pages/SignUp.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static const String _title = 'Liv - Reading Tracker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => SignUp(),
        '/': (context) => ReadingTracker(),
      },
      initialRoute: '/signup',
    );
  }
}
