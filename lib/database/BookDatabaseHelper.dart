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
          "CREATE TABLE books(id INTEGER PRIMARY KEY, cover_path TEXT, title TEXT, author TEXT, year INTEGER, date TEXT, rating INTEGER, reading INTEGER, to_read INTEGER)",
        );
      },
      version: _version,
    );
  }

  Future<void> insertBook(Book book) async {
    final Database db = _db;
    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Book>> books() async {
    final Database db = _db;
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
          reading: maps[i]['reading'],
          toRead: maps[i]['to_read']);
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
