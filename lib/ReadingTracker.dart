import 'package:flutter/material.dart';
import './widgets/CustomAppBar.dart';

class ReadingTracker extends StatelessWidget {
  static const String _title = 'Liv - Reading Tracker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(title: _title),
        body: SafeArea(
          child: Column(
            children: [const Text("Hello,"), const Text("Ms. Anne")],
          ),
        ),
      ),
    );
  }
}
