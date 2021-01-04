import 'package:flutter/material.dart';
import '../widgets/BookListingCard.dart';
import '../widgets/TextTitle.dart';

class CurrentlyReading extends StatelessWidget {
  CurrentlyReading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Currently Reading',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          // BookListingCard(),
          BookCover(),

          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter some number';
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Page you\'re at',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter some date';
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Beggining date',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          elevation: 8,
                          color: Theme.of(context).primaryColor,
                          child: Text("Update",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text("Info successfully updated"),
                              ),
                            );
                          },
                        ),
                        RaisedButton(
                          elevation: 8,
                          child: Text("Finish Book"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookCover extends StatelessWidget {
  const BookCover({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 175,
        width: MediaQuery.of(context).size.width * 0.27,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: const Text("Book cover"),
        ),
      ),
    );
  }
}
