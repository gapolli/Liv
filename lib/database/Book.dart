class Book {
  int id;
  String coverPath;
  String title;
  String author;
  int year;
  String date;
  int rating;
  bool reading;
  bool toRead;

  Book({
    this.id,
    this.coverPath,
    this.title,
    this.author,
    this.year,
    this.date,
    this.rating,
    this.reading,
    this.toRead,
  });

  factory Book.fromDatabase(Map<String, dynamic> data) => Book(
        id: data['id'],
        coverPath: data['cover_path'],
        title: data['title'],
        author: data['author'],
        year: data['year'],
        date: data['date'],
        rating: data['rating'],
        reading: data['reading'] == 0 ? false : true,
        toRead: data['to_read'] == 0 ? false : true,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'cover_path': this.coverPath,
      'title': this.title,
      'author': this.author,
      'year': this.year,
      'date': this.date,
      'rating': this.rating,
      'reading': this.reading == false ? 0 : 1,
      'to_read': this.toRead == false ? 0 : 1,
    };
  }

  Book.fromMap(map) {
    this.id = map['id'];
    this.coverPath = map['cover_path'];
    this.title = map['title'];
    this.author = map['author'];
    this.year = map['year'];
    this.date = map['date'];
    this.rating = map['rating'];
    this.reading = map['reading'] == 0 ? false : true;
    this.toRead = map['to_read'] == 0 ? false : true;
  }

  @override
  String toString() {
    return 'Book{id: $id, cover: $coverPath, title: $title, author: $author, year: $year, date: $date, rating: $rating, reading: $reading, to_read: $toRead}';
  }
}
