import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user/user.dart';

class UserDatabaseHelper {
  static UserDatabaseHelper helper = UserDatabaseHelper._createInstance();
  static Database _database;

  String userTable = 'usertable';
  String colName = 'name';
  String colEmail = 'email';
  String colPwd = 'pwd';
  String colGender = 'gender';

  UserDatabaseHelper._createInstance();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'user.db';

    var userDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return userDatabase;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $userTable ($colName text, $colEmail text, $colPwd text, $colGender text)');
  }

  insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert(userTable, user.toMap());
    return result;
  }

  getUserMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $userTable');
    return result;
  }

  getUserList() async {
    var noteMapList = await getUserMapList();
    int count = noteMapList.length;
    List<User> noteList = List<User>();

    for (int i = 0; i < count; i++) {
      noteList.add(User.fromMap(noteMapList[i]));
    }
    return noteList;
  }

  updateUser(User user) async {
    Database db = await this.database;
    var result = await db.update(userTable, user.toMap(),
        where: '$colName = ?', whereArgs: [user.name]);
    return result;
  }

  deleteUser(String name) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $userTable WHERE $colName = $name');
    return result;
  }

  getCount() async {
    Database db = await this.database;
    var x = await db.rawQuery('SELECT COUNT(*) FROM $userTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
