class Book {
  String title;
  DateTime publishDate = DateTime.now();
  String coment;

  Book(
    this.publishDate, {
    required this.title,
    required this.coment,
  });
}

/// 다음 동작을 할 수 있도록 Book 클래스를 수정하시오.
//
// 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다.
// Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
// deep copy 를 지원한다
