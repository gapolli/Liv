import 'package:flutter/material.dart';

class Search extends StatelessWidget {
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
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter some text';
                    return null;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ResultCard(text: 'Result 1'),
                ResultCard(text: 'Result 2'),
                ResultCard(text: 'Result 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String _text;

  const ResultCard({Key key, String text})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 25),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Text(_text),
      ),
    );
  }
}
