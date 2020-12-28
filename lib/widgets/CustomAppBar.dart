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
          fontSize: 24,
        ),
      ),
      centerTitle: true,
    );
  }
}
