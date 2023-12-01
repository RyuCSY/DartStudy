import 'dart:math';

/**
 * 1-1 현실세계의 성직자 “클레릭" 를 표현하는 클래스 Cleric 를 작성 하시오.
 *    속성이나 동작은 작성 할 필요 없습니다. (내용은 아무것도 작성하지 않아도 됨)
 */
class Cleric {
  static const int MAX_OF_HP = 50;
  static const int MAX_OF_MP = 10;

  //1-2 멤버 필드 및 생성자.
  String name;
  int hp = MAX_OF_HP;
  int mp = MAX_OF_MP;

  Cleric(this.name);

  /**
   * 1-3 성직자는 “셀프 에이드" 라는 마법을 사용할 수 있고, MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.
   *  연습 1-2 에 선언한 Cleric 클래스에 “selfAid()” 메소드를 추가 하시오.
   *  또한, 이 메소드는 인수가 없고, 리턴 값도 없다.
   */
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

  /**
   * 1-4 성직자는 “기도하기" (pray) 라는 행동을 취할 수 있고, 자신의 MP를 회복한다.
   *  회복량은 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양이다 (3초 기도하면 회복량은 3 ~ 5 포인트). 단, 최대 MP 보다 더 회복하는 것은 불가능 하다.
   *  연습 1-3에서 선언한 Cleric 클래스에 “pray()” 메소드를 추가하시오.
   *  이 메소드는 인수에 “기도할 시간(초)"를 지정할 수 있고, 리턴 값은 “실제로 회복된 MP 양" 을 반환한다.
   */
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
