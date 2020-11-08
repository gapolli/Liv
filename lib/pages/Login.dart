import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Login();
  }
}

class _Login extends State<Login> {
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
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
          TextFormField(
            //TODO: obscure text
            validator: (value) {
              if (value.isEmpty) return 'Please enter some text';
              if (value.length < 8) return "Please, insert a secure password";
              return null;
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.security),
              hintText: 'Your password',
              labelText: 'Password *',
            ),
          ),
          Row(
            children: [
              Text('Forgot Password?'),
              RaisedButton(
                child: Text('Log in'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
          Divider(),
          Text('Don\'t have an account yet?\nSign up here, it\'s quick!'),
        ],
      ),
    );
  }
}
