import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    @required String title,
  })  : _title = title,
        super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AppBar(
        elevation: 0,
        title: Text(
          _title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {},
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.black54,
          labelColor: Colors.black87,
          labelPadding: EdgeInsets.symmetric(vertical: 0),
          indicatorPadding: EdgeInsets.symmetric(vertical: 10),
          tabs: [
            Tab(text: "Your Reading"),
            Tab(text: "To Read"),
            Tab(text: "Statistics"),
          ],
        ),
      ),
    );
  }
}
