import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginWidget();
  }
}

class _LoginWidget extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Liv Reading Tracker",
            ),
            Text(
              "Log in and enjoy your reading",
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) return 'Please enter some text';
                if (!value.contains('@'))
                  return "Please, insert a valid email address";
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Your email address',
                labelText: 'E-mail *',
              ),
            ),
            TextFormField(), //TODO: implement password input
          ],
        ),
      ),
    );
  }
}
