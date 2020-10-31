import 'package:flutter/material.dart';

class NestedTabBar extends StatelessWidget {
  const NestedTabBar({
    Key key,
    @required TabController nestedTabController,
    @required List<Widget> myTabs,
  })  : _nestedTabController = nestedTabController,
        _myTabs = myTabs,
        super(key: key);

  final TabController _nestedTabController;
  final List<Widget> _myTabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _nestedTabController,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.black54,
      labelColor: Colors.black87,
      labelPadding: EdgeInsets.symmetric(vertical: 0),
      indicatorPadding: EdgeInsets.symmetric(vertical: 10),
      tabs: _myTabs,
    );
  }
}
