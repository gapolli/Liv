import 'package:flutter/material.dart';
import '../pages/YourReading.dart';
import '../pages/ToRead.dart';
import '../pages/Statistics.dart';
import '../widgets/NestedTabBar.dart';
import '../widgets/NestedTabBarView.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _nestedTabController;

  final _myTabs = <Widget>[
    Tab(text: "Your Reading"),
    Tab(text: "To Read"),
    Tab(text: "Statistics"),
  ];

  final _tabPages = <Widget>[
    YourReading(),
    ToRead(),
    Statistics(),
  ];

  @override
  void initState() {
    super.initState();

    _nestedTabController =
        new TabController(length: _myTabs.length, vsync: this);
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
        NestedTabBar(
          nestedTabController: _nestedTabController,
          myTabs: _myTabs,
        ),
        NestedTabBarView(
          screenHeight: screenHeight,
          nestedTabController: _nestedTabController,
          tabPages: _tabPages,
        ),
      ],
    );
  }
}
