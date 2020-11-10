class User {
  int _id;
  String _name;
  String _email;
  String _pwd;
  String _gender;
  int _newsletter;

  User(
      [this._id,
      this._name,
      this._email,
      this._pwd,
      this._gender,
      this._newsletter]);

  User.fromMap(map) {
    this._id = map['id'];
    this._name = map['name'];
    this._email = map['email'];
    this._pwd = map['pwd'];
    this._gender = map['gender'];
    this._newsletter = map['newsletter'];
  }

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get pwd => _pwd;
  String get gender => _gender;
  int get newsletter => _newsletter;

  set id(var newId) {
    this._id = newId;
  }

  set name(String newName) {
    if (newName.length > 0) this._name = newName;
  }

  set email(String newEmail) {
    if (newEmail.length > 0 && newEmail.contains('@')) this._email = newEmail;
  }

  set pwd(String newPassword) {
    if (newPassword.length > 0) this._pwd = newPassword;
  }

  set gender(String newGender) {
    if (newGender.length > 0) this._gender = newGender;
  }

  set newsletter(int newNewsletter) {
    this._newsletter = newNewsletter;
  }

  toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['pwd'] = _pwd;
    map['gender'] = _gender;
    map['newsletter'] = _newsletter;
    return map;
  }
}
