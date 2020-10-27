import 'package:flutter/material.dart';
import '../widgets/TextTitle.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
        child: SafeArea(
          child: Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: TextTitle('Liv - Reading Tracker'),
                  ),
                  const Text('Sign Up and enjoy your reading'),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return 'Please enter some text';
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Your full name',
              labelText: 'Full Name *',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return 'Please enter some text';
              if (!value.contains('@'))
                return "Please, insert a valid email address";
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Your email address',
              labelText: 'E-mail *',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return 'Please enter some text';
              if (value.length < 8)
                return 'The password must have at least 8 characters';
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Your email address',
              labelText: 'Password *',
            ),
          ),
          Divider(),
          Column(
            children: [
              const Text("Let us know the genres you like"),
              CheckboxListTile(
                title: const Text('Romance'),
                value: false,
                onChanged: (bool newValue) => print('Apertou aqui'),
              ),
              CheckboxListTile(
                title: const Text('Horror'),
                value: false,
                onChanged: (bool newValue) => print('Apertou aqui'),
              ),
              CheckboxListTile(
                title: const Text('Suspense'),
                value: false,
                onChanged: (bool newValue) => print('Apertou aqui'),
              ),
              CheckboxListTile(
                title: const Text('Non-fiction'),
                value: false,
                onChanged: (bool newValue) => print('Apertou aqui'),
              ),
              CheckboxListTile(
                title: const Text('Scientific Fiction'),
                value: false,
                onChanged: (bool newValue) => print('Apertou aqui'),
              ),
            ],
          ),
          SwitchListTile(
            title: const Text('Reading Tracker newsletter'),
            value: false,
            onChanged: (bool val) => print('Apertou aqui'),
          ),
          Divider(),
          RaisedButton(
              color: Colors.white70,
              child: Text("Submit"),
              onPressed: () {
                print('Apertou aqui');
              }),
        ],
      ),
    );
  }
}
