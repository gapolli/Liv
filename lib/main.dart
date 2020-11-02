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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w500),
          headline6: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w100),
          caption: TextStyle(fontSize: 18.0, color: Colors.black54),
          subtitle2: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[900],
              fontWeight: FontWeight.w300),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => SignUp(),
        '/': (context) => ReadingTracker(),
      },
      initialRoute: '/signup',
    );
  }
}
