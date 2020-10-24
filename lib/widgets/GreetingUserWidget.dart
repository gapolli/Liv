import 'package:flutter/material.dart';

class GreetingUserWidget extends StatelessWidget {
  const GreetingUserWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hello,",
            style: TextStyle(
              fontSize: 36,
              color: Colors.black45,
            ),
          ),
          const Text(
            "Ms. Anne",
            style: TextStyle(
              fontSize: 36,
            ),
          )
        ],
      ),
    );
  }
}
