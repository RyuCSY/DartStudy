import 'dart:core';
import 'dart:math';

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate = DateTime.now();
  String coment;
  String strPublishDate = '';

  Book({
    required this.title,
    required this.publishDate,
    required this.coment,
  }) {
    /// 과제물을 돌려받음: "12/07 Github" >> 출간일쪽만 날짜까지만 비교로 보완되면 너무 좋겠네요. 수고하셨습니다.
    this.strPublishDate = publishDate.toIso8601String().split('T').first;
  }

  // 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          strPublishDate == other.strPublishDate;

  @override
  int get hashCode => title.hashCode ^ strPublishDate.hashCode;

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
    return 'Book{title: $title, publishDate: ${strPublishDate}}';
  }
}

main() {
  var publishDate = DateTime.utc(2018, 10, 1);

  // 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다. 검증
  Book book1 =
      Book(title: '생존코딩', publishDate: publishDate, coment: '베스트셀러');

  Book book2 =
      Book(title: '생존코딩', publishDate: publishDate, coment: '베스트셀러');

  print('book1 same book2 : ${book1 == book2}');
  print('check set size : ${{book1, book2}.length}');

// Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
  book1.title += ' (개정판)';
  var bookList = [];

  Random r = Random();

  for (int i = 1; i <= 5; i++) {
    var title = '스즈미야 하루히의 우울 $i권 (사실 책은 아니지만, 애니가 방영순 회차와 실제 보는 순서가 다름)';
    var publishDate =
        DateTime.utc(2010 + r.nextInt(13), r.nextInt(13), r.nextInt(32));
    bookList.add(book1.copyWith(title: title, publishDate: publishDate));
  }

  print('\n========= 출간일이 오래된 순서 정렬 전 =========');

  bookList.forEach((book) {
    print('$book');
  });
  bookList.sort();

  print('\n========= 출간일이 오래된 순서 정렬 후 =========');

  bookList.forEach((book) {
    print('$book');
  });
}
