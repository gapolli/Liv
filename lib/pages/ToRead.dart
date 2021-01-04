import 'package:flutter/material.dart';
import '../widgets/BookListingCard.dart';
import '../database/BookDatabaseHelper.dart';
import '../database/Book.dart';

class ToRead extends StatefulWidget {
  List<Book> books = [];

  ToRead({Key key}) : super(key: key);

  @override
  _ToReadState createState() => _ToReadState();
}

class _ToReadState extends State<ToRead> {
  var db = BookDatabaseHelper.helper;

  @override
  Widget build(BuildContext context) {
    db.getToReadList().then((result) {
      print(result);
      setState(() {
        this.widget.books = result;
      });
    });

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
            child: ListView.builder(
              itemCount: this.widget.books.length,
              itemBuilder: (BuildContext context, int index) {
                return BookListingCard(book: this.widget.books[index]);
              },
            )),
      ],
    );
  }
}
