class Book {
  final int id;
  final String cover;
  final String title;
  final String author;
  final int year;
  final DateTime date;
  final int rating;
  final int reading;
  final int toRead;

  Book({
    this.id,
    this.cover,
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
      'cover': cover,
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
    return 'Book{id: $id, cover: $cover, title: $title, author: $author, year: $year, date: $date, rating: $rating, reading: $reading, to_read: $toRead}';
  }
}
