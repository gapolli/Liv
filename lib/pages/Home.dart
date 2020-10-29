import 'package:flutter/material.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GreetingUserWidget.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Liv - Reading Tracker"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: SafeArea(
          child: GreetingUserWidget(),
        ),
      ),
    );
  }
}
