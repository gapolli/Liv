import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Book.dart';

class BookDatabaseHelper {
  static BookDatabaseHelper helper = BookDatabaseHelper._createInstance();
  static Database _db;
  int _version = 1;
  BookDatabaseHelper._createInstance();

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDatabase();
    }
    return _db;
  }

  Future<Database> initializeDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'book_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE books(id INTEGER PRIMARY KEY, cover TEXT, title TEXT, author TEXT, year INTEGER, date DATETIME, rating INTEGER, reading INTEGER, to_read INTEGER)",
        );
      },
      version: _version,
    );
  }

  Future<void> insertBook(Book book) async {
    final Database db = _db;
    await db.insert(
      'Books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Book>> books() async {
    final Database db = _db;
    final List<Map<String, dynamic>> maps = await db.query('Books');
    return List.generate(maps.length, (i) {
      return Book(
        id: maps[i]['id'],
        cover: maps[i]['cover'],
        title: maps[i]['title'],
        author: maps[i]['author'],
        year: maps[i]['year'],
        date: maps[i]['date'],
        rating: maps[i]['rating'],
      );
    });
  }

  Future<int> updateBook(Book book) async {
    final db = _db;
    final res = await db.update(
      'books',
      book.toMap(),
      where: "id = ?",
      whereArgs: [book.id],
    );

    return res;
  }

  Future<int> deleteBook(int id) async {
    final db = _db;
    final res = await db.delete(
      'books',
      where: "id = ?",
      whereArgs: [id],
    );

    return res;
  }
}
