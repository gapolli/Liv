import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Text('Liv - Reading Tracker',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ),
                  Text(
                    'Sign Up and enjoy your reading',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Divider(),
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
              hintText: 'Your password',
              labelText: 'Password *',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text(
                  'Gender',
                  style: Theme.of(context).textTheme.caption,
                ),
                ListTile(
                  title: const Text('Male'),
                  leading: Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (bool value) {},
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (bool value) {},
                  ),
                ),
                ListTile(
                  title: const Text('Non-binary'),
                  leading: Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (bool value) {},
                  ),
                ),
                ListTile(
                  title: const Text('Other'),
                  leading: Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (bool value) {
                      print('Something');
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Let us know the genres you like",
            style: Theme.of(context).textTheme.caption,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                ChoiceChip(
                  label: Text('Romance'),
                  selected: false,
                  onSelected: (bool selected) {
                    print("minha nossa");
                  },
                ),
                ChoiceChip(
                  label: Text('Horror'),
                  selected: false,
                  onSelected: (bool selected) {
                    print("minha nossa");
                  },
                ),
                ChoiceChip(
                  label: Text('Suspense'),
                  selected: false,
                  onSelected: (bool selected) {
                    print("minha nossa");
                  },
                ),
                ChoiceChip(
                  label: Text('Non-fiction'),
                  selected: false,
                  onSelected: (bool selected) {
                    print("minha nossa");
                  },
                ),
                ChoiceChip(
                  label: Text('Scientific Fiction'),
                  selected: false,
                  onSelected: (bool selected) {
                    print("minha nossa");
                  },
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Reading Tracker newsletter'),
            value: false,
            onChanged: (bool val) => print('Apertou aqui'),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 50.0),
                child: RaisedButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  color: Colors.white54,
                  child: Text("Submit"),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
