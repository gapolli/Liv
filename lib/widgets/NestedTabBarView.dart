import 'package:flutter/material.dart';

class NestedTabBarView extends StatelessWidget {
  const NestedTabBarView({
    Key key,
    @required this.screenHeight,
    @required TabController nestedTabController,
    @required List<Widget> tabPages,
  })  : _nestedTabController = nestedTabController,
        _tabPages = tabPages,
        super(key: key);

  final double screenHeight;
  final TabController _nestedTabController;
  final List<Widget> _tabPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.70,
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: TabBarView(
        controller: _nestedTabController,
        children: _tabPages,
      ),
    );
  }
}
