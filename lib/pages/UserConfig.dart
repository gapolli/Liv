import 'package:flutter/material.dart';
import 'package:liv_reading_tracker/widgets/TextTitle.dart';

class UserConfig extends StatelessWidget {
  UserConfig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TextTitle("User"),
      ],
    );
  }
}
