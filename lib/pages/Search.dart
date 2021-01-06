import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './../api_key.dart';
import '../database/BookDatabaseHelper.dart';
import '../database/Book.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  final apiKey = secrets['apiKey'];
  final booksFound = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Search',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 15),
            child: Form(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) async {
                    if (value == "")
                      setState(() {
                        booksFound.clear();
                      });

                    final response = await http
                        .get(this.baseUrl + 'volumes?q=$value&key=$apiKey');

                    final all = json.decode(response.body);

                    if (all != null) {
                      if (booksFound.length > 5)
                        setState(() {
                          booksFound.clear();
                        });

                      all['items'].forEach((item) {
                        setState(() {
                          booksFound.add(
                            Book(
                              title: item['volumeInfo']['title'],
                              coverPath: item['volumeInfo']['imageLinks']
                                      ['smallThumbnail']
                                  .replaceAll('http', 'https'),
                              date: item['volumeInfo']['publishedDate'],
                              rating: 0,
                              reading: false,
                              toRead: true,
                              // author: item['volumeInfo']['authors'][0] as String,
                            ),
                          );
                        });
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Book\'s title',
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                itemCount: booksFound.length,
                itemBuilder: (BuildContext context, int index) {
                  if (booksFound[index] != null) {
                    return ResultCard(book: booksFound[index]);
                  } else {
                    return Center(
                      child: const Text("Search your favorite book :)"),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatefulWidget {
  final Book _book;

  const ResultCard({Key key, Book book})
      : _book = book,
        super(key: key);

  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  bool isBtnDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: 25),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 175,
              margin: EdgeInsets.only(right: 10),
              child: Image.network(widget._book.coverPath),
            ),
            Flexible(
              child: Text(
                widget._book.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                    tooltip: 'Add to To Read',
                    enableFeedback: true,
                    hoverColor: Colors.pink[300],
                    highlightColor: Colors.pink[300],
                    splashColor: Colors.pink[300],
                    iconSize: 32,
                    color: Colors.pink,
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: isBtnDisabled
                        ? null
                        : () async {
                            var db = BookDatabaseHelper.helper;
                            await db.insertBook(this.widget._book);

                            var res = await db.getBooksList();
                            print(res);

                            setState(() {
                              this.isBtnDisabled = true;
                            });
                          },
                  ),
                ),
                Container(
                  child: IconButton(
                    tooltip: 'Add to Reading',
                    enableFeedback: true,
                    hoverColor: Colors.pink[300],
                    highlightColor: Colors.pink[300],
                    splashColor: Colors.pink[300],
                    iconSize: 32,
                    color: Colors.pink,
                    icon: Icon(Icons.my_library_books),
                    onPressed: isBtnDisabled
                        ? null
                        : () async {
                            this.widget._book.reading = true;
                            this.widget._book.toRead = false;
                            var db = BookDatabaseHelper.helper;
                            await db.insertBook(this.widget._book);

                            var res = await db.getBooksList();
                            print(res);

                            setState(() {
                              this.isBtnDisabled = true;
                            });
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
