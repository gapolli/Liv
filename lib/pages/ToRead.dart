import 'package:flutter/material.dart';
import '../widgets/BookListingCard.dart';

class ToRead extends StatelessWidget {
  ToRead({Key key}) : super(key: key);
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'To Read',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          flex: 1,
          child: entries.length > 0
              ? ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookListingCard();
                  },
                )
              : Center(child: const Text("Empty")),
        ),
      ],
    );
  }
}
