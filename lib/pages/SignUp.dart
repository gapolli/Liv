import 'package:flutter/material.dart';
import './../database/user_database_helper.dart';
import '../models/user/user.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUp();
  }
}

class _SignUp extends State<SignUp> {
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

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUpForm();
  }
}

enum Gender {
  masculino,
  feminino,
  nonbinary,
  other,
}

class _SignUpForm extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  User model = User();

  bool _newsletter = false;
  Gender _gender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return 'Please enter some text';
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              model.name = value;
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
                return 'Please, insert a valid email address';
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              model.email = value;
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

              _formKey.currentState.save();

              return null;
            },
            onSaved: (String value) {
              model.pwd = value;
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
                    value: Gender.masculino,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: Gender.feminino,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Non-binary'),
                  leading: Radio(
                    value: Gender.nonbinary,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Other'),
                  leading: Radio(
                    value: Gender.other,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Let us know the genres you like',
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
                    print('minha nossa');
                  },
                ),
                ChoiceChip(
                  label: Text('Horror'),
                  selected: false,
                  onSelected: (bool selected) {
                    print('minha nossa');
                  },
                ),
                ChoiceChip(
                  label: Text('Suspense'),
                  selected: false,
                  onSelected: (bool selected) {
                    print('minha nossa');
                  },
                ),
                ChoiceChip(
                  label: Text('Non-fiction'),
                  selected: false,
                  onSelected: (bool selected) {
                    print('minha nossa');
                  },
                ),
                ChoiceChip(
                  label: Text('Scientific Fiction'),
                  selected: false,
                  onSelected: (bool selected) {
                    print('minha nossa');
                  },
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Reading Tracker newsletter'),
            value: _newsletter,
            onChanged: (bool val) => {
              setState(() {
                _newsletter = val;
              })
            },
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
                  child: Text('Submit'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      var database = UserDatabaseHelper.helper;

                      model.id = null;
                      model.newsletter = _newsletter ? 1 : 0;
                      model.gender = _gender.toString();

                      await database.insertUser(model);
                      List users = await database.getUserMapList();
                      print(users);
                    }
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
