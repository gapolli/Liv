import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user/user.dart';

class UserDatabaseHelper {
  static UserDatabaseHelper helper = UserDatabaseHelper._createInstance();
  static Database _db;
  int _version = 4;
  UserDatabaseHelper._createInstance();

  String userTable = 'usertable';
  String colId = 'id';
  String colName = 'name';
  String colEmail = 'email';
  String colPwd = 'pwd';
  String colGender = 'gender';
  String colNewsletter = 'newsletter';

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDatabase();
    }
    return _db;
  }

  Future<Database> initializeDatabase() async {
    print('inicializou o db');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path + 'user2.db');
    print(path);
    print(_createDb);

    var db = await openDatabase(path, version: _version, onCreate: _createDb);

    return db;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $userTable ($colId INTEGER PRIMARY KEY, $colName text, $colEmail text, $colPwd text, $colGender text, $colNewsletter integer)');
  }

  Future testDb() async {
    Database db = await this.db;
    await db.execute(
        'INSERT INTO $userTable values ("Victor", "email@teste.com", "senha123", "masculino")');

    List res = await db.rawQuery("SELECT * FROM $userTable");
    print(res[0].toString());
    print(res);
  }

  insertUser(User user) async {
    Database db = await this.db;
    var res = await db.insert(
      userTable,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }

  getUserMapList() async {
    Database db = await this.db;
    var res = await db.rawQuery('SELECT * FROM $userTable');
    return res;
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
    Database db = await this.db;
    var res = await db.update(userTable, user.toMap(),
        where: '$colName = ?', whereArgs: [user.name]);
    return res;
  }

  deleteUser(String name) async {
    Database db = await this.db;
    int res =
        await db.rawDelete('DELETE FROM $userTable WHERE $colName = $name');
    return res;
  }

  getCount() async {
    Database db = await this.db;
    var x = await db.rawQuery('SELECT COUNT(*) FROM $userTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
