import 'package:flutter/material.dart';
import '../widgets/TextTitle.dart';
import '../widgets/BookListingCard.dart';

class ToRead extends StatelessWidget {
  ToRead({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TextTitle("To Read"),
          BookListingCard(),
          BookListingCard(),
          BookListingCard(),
        ],
      ),
    );
  }
}
