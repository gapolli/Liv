import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String _text;

  const TextTitle(String text, {Key key})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
