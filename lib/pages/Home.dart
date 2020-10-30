import 'package:flutter/material.dart';
import '../pages/YourReading.dart';
import '../pages/ToRead.dart';
import '../pages/Statistics.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.black54,
          labelColor: Colors.black87,
          labelPadding: EdgeInsets.symmetric(vertical: 0),
          indicatorPadding: EdgeInsets.symmetric(vertical: 10),
          tabs: <Widget>[
            Tab(text: "Your Reading"),
            Tab(text: "To Read"),
            Tab(text: "Statistics"),
          ],
        ),
        Container(
          height: screenHeight * 0.70,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              YourReading(),
              ToRead(),
              Statistics(),
            ],
          ),
        ),
      ],
    );
  }
}
