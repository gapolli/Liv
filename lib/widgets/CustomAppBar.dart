import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    @required String title,
  })  : _title = title,
        super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
