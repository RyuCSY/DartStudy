import '../12_05/inheritance/hero_example.dart';

class CompareHero extends SuperHero {
  String nickName;
  int age;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompareHero &&
          runtimeType == other.runtimeType &&
          nickName == other.nickName &&
          age == other.age;

  @override
  int get hashCode => nickName.hashCode ^ age.hashCode;

  CompareHero(
    String name,
    int hp, {
    this.nickName = '한석봉',
    this.age = 23,
  }) : super(name, hp);
}

main() {
  CompareHero superHero1 = CompareHero('한석봉', 50);
  CompareHero superHero2 = CompareHero('한석봉', 50);

  print(superHero1 == superHero2);
}
