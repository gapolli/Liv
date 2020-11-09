import 'package:flutter/material.dart';
import 'package:liv_reading_tracker/widgets/BookListingCard.dart';
import 'package:liv_reading_tracker/widgets/TextTitle.dart';

class ToRead extends StatelessWidget {
  ToRead({Key key}) : super(key: key);
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: entries.length > 0
          ? ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return BookListingCard();
              },
            )
          : Center(
              child: const Text('Empty'),
            ),
    );
  }
}
