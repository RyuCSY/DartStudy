import 'dart:math';

class Cleric {
  /// 연습문제 2-1.
  ///
  /// 1장의 연습문제에서 작성한 Cleric클래스에 관하여, 2가지 수정을 행하시오.
  /// 현시점의 Cleric 클래스의 정의에는, 각 인스턴스별로 최대 HP와 최대 MP 필드에 정보를 가지고 있습니다. 하지만,
  /// 모든 성직자의 최대 HP 는 50, 최대 MP 는 10으로 정해져 있어, 각 인스턴스가 각각의 정보를 가지는 것은 메모리 낭비이다.
  /// 그래서, 최대 HP, 최대 MP의 필드가 각 인스턴스별로 있지 않도록, 필드 선언에 적절한 키워드를 추가 하던지 말던지 자유.
  ///
  /// 이미 적용된 내용이라 주석만 커밋.
  static const int MAX_OF_HP = 50;
  static const int MAX_OF_MP = 10;

  String name;
  int hp;
  int mp;

  /// 2. 아래의 방침에 따라, 생성자를 추가 하시오.
  ///
  /// A)~D) 까지 사용 예시는 아래 링크
  /// ```
  /// <a href="https://github.com/RyuCSY/DartStudy/blob/master/lib/12_01/homework/test_main.dart">여기를 확인 하세요.</a>
  /// ```html
  ///
  Cleric(
    this.name, {
    this.hp = MAX_OF_HP,
    this.mp = MAX_OF_MP,
  }) {
    validate();
  }

  void selfAid() {
    final int reducedMp = 5;

    print('$name 은(는) selfAid 를 시전 하였다.');

    if (mp < reducedMp) {
      print('그러나 MP 부족으로 실패하였다.');
    } else {
      mp -= reducedMp;
      hp = MAX_OF_HP;

      print('$name 은(는) MP $reducedMp 를 소모하여 hp $MAX_OF_HP 를 회복 하였다.');
    }
  }

  int pray(int sec) {
    print('$name 은(는) pray 를 시전 하였다.');

    if (sec == 0) {
      print('그러나 정성이 부족 하였다.');
      return 0;
    }

    int retVal = (Random().nextInt(3) + sec);
    if (MAX_OF_MP < retVal) {
      retVal = MAX_OF_MP;
    }

    mp += retVal;

    validate();

    print('$name 은(는) $sec 초의 기도 끝에 $retVal 만큼 MP 를 회복 하였다. 현재 mp $mp');

    return retVal;
  }

  /// hp 와 mp 의 상한선 초과 여부 검사 및 값 보정.
  void validate() {
    hp = (hp > MAX_OF_HP) ? MAX_OF_HP : hp;
    mp = (mp > MAX_OF_MP) ? MAX_OF_MP : mp;
  }

  @override
  String toString() {
    return 'Cleric{name: $name, hp: $hp, mp: $mp}';
  }
}
