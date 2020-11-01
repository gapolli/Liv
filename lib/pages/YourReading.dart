import 'package:flutter/material.dart';
import 'package:liv_reading_tracker/widgets/BookListingCard.dart';
import '../widgets/TextTitle.dart';

class YourReading extends StatelessWidget {
  YourReading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextTitle("Currently Reading"),
            BookListingCard(),
            Center(
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                color: Colors.white54,
                child: Text("Finish Book"),
                onPressed: () {},
              ),
            ),
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
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              color: Colors.white54,
              child: Text("Update"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
