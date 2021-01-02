import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './../api_key.dart';

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
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Search',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Form(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter some text';
                    return null;
                  },
                  onChanged: (value) async {
                    final response = await http
                        .get(this.baseUrl + 'volumes?q=$value&key=$apiKey');

                    final all = json.decode(response.body);

                    if (all != null) {
                      if (booksFound.length > 4)
                        setState(() {
                          booksFound.clear();
                        });

                      setState(() {
                        booksFound.add(all['items']);
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
                  return ResultCard(
                    text: booksFound[index][index]['volumeInfo']['title'],
                    thumb: booksFound[index][index]['volumeInfo']['imageLinks']
                        ['smallThumbnail'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String _text;
  final String _thumb;

  const ResultCard({Key key, String text, String thumb})
      : _text = text,
        _thumb = thumb,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 25),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 175,
              margin: EdgeInsets.only(right: 10),
              child: Image.network(_thumb),
            ),
            Flexible(
              child: Text(
                _text,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
