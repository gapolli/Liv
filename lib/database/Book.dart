class Book {
  final int id;
  final String coverPath;
  final String title;
  final String author;
  final int year;
  final String date;
  final int rating;
  final int reading;
  final int toRead;

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cover_path': coverPath,
      'title': title,
      'author': author,
      'year': year,
      'date': date,
      'rating': rating,
      'reading': reading,
      'to_read': toRead,
    };
  }

  @override
  String toString() {
    return 'Book{id: $id, cover: $coverPath, title: $title, author: $author, year: $year, date: $date, rating: $rating, reading: $reading, to_read: $toRead}';
  }
}
