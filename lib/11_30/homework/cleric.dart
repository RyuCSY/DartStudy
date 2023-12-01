import 'dart:math';

class Cleric {
  /**
   * 1장의 연습문제에서 작성한 Cleric클래스에 관하여, 2가지 수정을 행하시오.
   * 현시점의 Cleric 클래스의 정의에는, 각 인스턴스별로 최대 HP와 최대 MP 필드에 정보를 가지고 있습니다. 하지만,
   * 모든 성직자의 최대 HP 는 50, 최대 MP 는 10으로 정해져 있어, 각 인스턴스가 각각의 정보를 가지는 것은 메모리 낭비이다.
   * 그래서, 최대 HP, 최대 MP의 필드가 각 인스턴스별로 있지 않도록, 필드 선언에 적절한 키워드를 추가 하던지 말던지 자유.
   *
   * 이미 적용된 내용이라 주석만 커밋.
   */
  static const int MAX_OF_HP = 50;
  static const int MAX_OF_MP = 10;

  String name;
  int hp = MAX_OF_HP;
  int mp = MAX_OF_MP;

  Cleric(this.name);

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

    int ret = (Random().nextInt(3) + sec);
    if (MAX_OF_MP < ret) {
      ret = MAX_OF_MP;
    }

    mp += ret;

    if (MAX_OF_MP < mp) {
      mp = MAX_OF_MP;
    }

    print('$name 은(는) $sec 초의 기도 끝에 $ret 만큼 MP 를 회복 하였다. 현재 mp $mp');

    return ret;
  }
}
