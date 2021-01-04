import 'package:flutter/material.dart';
import '../database/Book.dart';

class BookListingCard extends StatelessWidget {
  final Book _book;
  const BookListingCard({Key key, Book book})
      : _book = book,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.31,
                child: Center(
                  child: Image.network(this._book.coverPath),
                ),
              ),
            ],
          ),
          Container(
            height: 175,
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      this._book.title,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "By nome do autor",
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Text(
                      this._book.date.toString(),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
