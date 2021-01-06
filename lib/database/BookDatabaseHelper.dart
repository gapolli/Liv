import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Book.dart';

class BookDatabaseHelper {
  static BookDatabaseHelper helper = BookDatabaseHelper._createInstance();
  static Database _db;
  int _version = 2;
  BookDatabaseHelper._createInstance();

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDatabase();
    }
    return _db;
  }

  Future<Database> initializeDatabase() async {
    print('inicializou o db');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path + 'book_database.db');
    print(path);
    print(_createDb);

    var db = await openDatabase(path, version: _version, onCreate: _createDb);

    return db;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE books(id INTEGER PRIMARY KEY, cover_path TEXT, title TEXT, author TEXT, year INTEGER, date TEXT, rating INTEGER, reading INTEGER, to_read INTEGER)",
    );
  }

  insertBook(Book book) async {
    Database db = await this.db;
    var res = await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return res;
  }

  Future<List<Book>> books() async {
    Database db = await this.db;

    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (i) {
      return Book(
        id: maps[i]['id'],
        coverPath: maps[i]['cover_path'],
        title: maps[i]['title'],
        author: maps[i]['author'],
        year: maps[i]['year'],
        date: maps[i]['date'],
        rating: maps[i]['rating'],
        reading: (maps[i]['reading'] ? true : false),
        toRead: (maps[i]['to_read'] ? true : false),
      );
    });
  }

  Future<int> updateBook(Book book) async {
    Database db = await this.db;

    final res = await db.update(
      'books',
      book.toMap(),
      where: "id = ?",
      whereArgs: [book.id],
    );
    return res;
  }

  Future<int> deleteBook(int id) async {
    Database db = await this.db;

    final res = await db.delete(
      'books',
      where: "id = ?",
      whereArgs: [id],
    );
    return res;
  }

  _getBooksMapList() async {
    Database db = await this.db;
    var res = await db.rawQuery('SELECT * FROM books');
    return res;
  }

  _getToReadBooks() async {
    Database db = await this.db;
    var res = await db.rawQuery('SELECT * FROM books WHERE to_read=1');
    return res;
  }

  _getReadingBooks() async {
    Database db = await this.db;
    var res = await db.rawQuery('SELECT * FROM books WHERE reading=1');
  }

  getToReadList() async {
    var booksMapList = await _getToReadBooks();
    print(booksMapList);
    int count = booksMapList.length;
    List<Book> bookList = [];

    for (int i = 0; i < count; i++) {
      bookList.add(Book.fromMap(booksMapList[i]));
    }
    return bookList;
  }

  getReadingList() async {
    var booksMapList = await _getReadingBooks();
    print(booksMapList);
    int count = booksMapList.length;
    List<Book> bookList = [];

    for (int i = 0; i < count; i++) {
      bookList.add(Book.fromMap(booksMapList[i]));
    }
    return bookList;
  }

  getBooksList() async {
    var booksMapList = await _getBooksMapList();
    int count = booksMapList.length;
    List<Book> bookList = [];

    for (int i = 0; i < count; i++) {
      bookList.add(Book.fromMap(booksMapList[i]));
    }
    return bookList;
  }

  getCount() async {
    Database db = await this.db;
    var x = await db.rawQuery('SELECT COUNT(*) FROM books');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
