import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  final String _text;

  const TextSubtitle(
    String text, {
    Key key,
  })  : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black54,
        ),
      ),
    );
  }
}
