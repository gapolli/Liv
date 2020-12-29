import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Book.dart';

class BookDatabaseHelper {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'book_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE books(id INTEGER PRIMARY KEY, cover TEXT, title TEXT, author TEXT, year INTEGER, date DATETIME, rating INTEGER)",
      );
    },
    version: 1,
  );

  Future<void> insertBook(Book book) async {
    final Database db = await database;
    await db.insert(
      'Books',
      Book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Book>> books() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Books');
    return List.generate(maps.length, (i) {
      return Book(
          id: maps[i]['id'],
          cover: maps[i]['cover'],
          title: maps[i]['title'],
          author: maps[i]['author'],
          year: maps[i]['year'],
          date: maps[i]['date'],
          rating: maps[i]['rating']);
    });
  }

  Future<void> updateBook(Book book) async {
    final db = await database;
    await db.update(
      'books',
      Book.toMap(),
      where: "id = ?",
      whereArgs: [Book.id],
    );
  }

  Future<void> deleteBook(int id) async {
    final db = await database;
    await db.delete(
      'books',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
