import 'package:flutter/material.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GreetingUserWidget.dart';

class Home extends StatelessWidget {
  const Home({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: SafeArea(
          child: GreetingUserWidget(),
        ),
      ),
    );
  }
}
