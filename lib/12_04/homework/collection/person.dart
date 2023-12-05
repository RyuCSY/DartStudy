/// 연습문제 2-2
///
/// 01. 이름을 가지는 Person 클래스를 작성하시오. Person 은 반드시 이름을 포함해야 합니다.
class Person {
  String name;

  Person(this.name);
}

main() {
  // 02. 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  List<Person> list = [Person('홍길동'), Person('한석봉')];

  // 03. List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
  list.forEach((person) {
    print(person.name);
  });
}
