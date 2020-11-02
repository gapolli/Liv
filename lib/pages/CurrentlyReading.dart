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
          const TextTitle("Currently Reading"),
          BookListingCard(),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          color: Colors.white54,
                          child: Text("Update"),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          color: Colors.green[300],
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
