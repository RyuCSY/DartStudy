import 'dart:core';
import 'dart:math';

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate = DateTime.now();
  String coment;

  Book({
    required this.title,
    required this.publishDate,
    required this.coment,
  });

  // 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

// Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  // deep copy 를 지원한다
  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? coment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      coment: coment ?? this.coment,
    );
  }

  @override
  String toString() {
    return 'Book{title: $title, publishDate: ${publishDate.toIso8601String().split('T').first}}';
  }
}

main() {
  var publishDate = DateTime.utc(2018, 10, 1);

  // 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다. 검증
  Book book1 = Book(
      title: '오준석의 생존코딩', publishDate: publishDate, coment: '라면 받침으로 사용하세요.');

  Book book2 = Book(
      title: '오준석의 생존코딩', publishDate: publishDate, coment: '라면 받침으로 사용하세요.');

  print('book1 same book2 : ${book1 == book2}');

// Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
  book1.title += ' (개정판)';
  var bookList = [book1];

  Random r = Random();
  int year = book1.publishDate.year;

  for (int i = 2; i <= 5; i++) {
    var title = '오준석의 생존코딩 (개정$i판)';
    var publishDate = DateTime.utc(++year, r.nextInt(13), r.nextInt(32));
    bookList.add(book1.copyWith(title: title, publishDate: publishDate));
  }

  bookList.sort();
  bookList.forEach((book) {
    print('$book');
  });
}
