import 'package:flutter/material.dart';

class ReadingTracker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BottomNavigationBar();
  }
}

class _BottomNavigationBar extends State<ReadingTracker> {
  int _currentPage;
  var _pages;

  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _pages = [generateLoginView(), generateSignupView(), GenerateFormView()];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GV Reading Tracker",
      home: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentPage),
        ),
        appBar: AppBar(
          title: const Text("GV Reading Tracker"),
          centerTitle: true,
          backgroundColor: Colors.pink[700],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: const Text('Login')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: const Text('Signup')),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_drive_file), title: const Text('Form'))
          ],
          fixedColor: Colors.redAccent,
          currentIndex: _currentPage,
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}

Widget generateLoginView() {
  return Center();
}

Widget generateSignupView() {
  return Center();
}

class GenerateFormView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GenerateFormView();
  }
}

class _GenerateFormView extends State<GenerateFormView> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _newsletter = false;
  Map _genres = {'horror': false, 'drama': false, 'romance': false};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) return 'Please enter some text';

                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
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
                icon: Icon(Icons.email),
                hintText: 'Your email address',
                labelText: 'E-mail *',
              ),
            ),
            SwitchListTile(
              title: const Text('Reading Tracker newslatter'),
              value: _newsletter,
              onChanged: (bool val) => setState(() => _newsletter = val),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: const Text(
                'Choose the genres you like',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _genres['horror'],
                      onChanged: (bool value) {
                        setState(() {
                          _genres['horror'] = value;
                        });
                      },
                    ),
                    Text("Horror"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _genres['drama'],
                      onChanged: (bool value) {
                        setState(() {
                          _genres['drama'] = value;
                        });
                      },
                    ),
                    Text("Drama"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _genres['romance'],
                      onChanged: (bool value) {
                        setState(() {
                          _genres['romance'] = value;
                        });
                      },
                    ),
                    const Text("Romance"),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: RaisedButton(
                color: Colors.pink[600],
                onPressed: () {
                  if (_formKey.currentState.validate())
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
