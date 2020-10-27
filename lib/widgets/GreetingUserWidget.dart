import 'package:flutter/material.dart';

class GreetingUserWidget extends StatelessWidget {
  const GreetingUserWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: RichText(
        text: TextSpan(
          text: 'Hello, \n',
          style: TextStyle(
            fontSize: 36,
            color: Colors.black45,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Dear User!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
