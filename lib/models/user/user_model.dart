import 'package:scoped_model/scoped_model.dart';
import 'package:liv_reading_tracker/database/user_database_helper.dart';
import 'user.dart';

class UserModel extends Model {
  int _stackIndex = 0;
  List userList = [];
  User _user = User("", "", "", "", false);

  get stackIndex => _stackIndex;
  set stackIndex(int newStackIndex) {
    _stackIndex = newStackIndex;
    notifyListeners();
  }

  get note => _user;
  set note(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  get name => _user.name;
  set name(String newName) {
    _user.name = newName;
    notifyListeners();
  }

  loadData() async {
    userList = await UserDatabaseHelper.helper.getUserList();
    notifyListeners();
  }
}
