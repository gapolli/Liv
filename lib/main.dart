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
        scaffoldBackgroundColor: Color.fromRGBO(255, 249, 240, 1),
        primaryColor: Color.fromRGBO(150, 140, 131, 1),
        accentColor: Color.fromRGBO(247, 218, 217, 1),
        fontFamily: 'Roboto',
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 10,
          selectedItemColor: Colors.pink,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
          headline6: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w100),
          caption: TextStyle(fontSize: 18.0, color: Colors.black54),
          subtitle2: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[900],
            fontWeight: FontWeight.w300,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(247, 218, 217, 1),
          height: 50,
          minWidth: 140,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => SignUp(),
        '/': (context) => ReadingTracker(),
      },
      initialRoute: '/',
    );
  }
}
