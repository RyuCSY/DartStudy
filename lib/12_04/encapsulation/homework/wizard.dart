import 'wand.dart';

/// 연습문제 10-1. 다음 2개의 클래스 “Wizard (마법사)”, “Wand (지팡이)” 를 작성하시오. 마법사는 지팡이를 들 수 있습니다.
class Wizard {
  // 이름
  String name;

  // 체력
  int hp;

  // 지팡이
  Wand? wand;

  Wizard(this.name, this.hp);
}
