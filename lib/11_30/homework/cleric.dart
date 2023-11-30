class Cleric {
  static const int MAX_OF_HP = 50;
  static const int MAX_OF_MP = 10;

  String name;
  int hp = MAX_OF_HP;
  int mp = MAX_OF_MP;

  Cleric(this.name);

  /**
   * 성직자는 “셀프 에이드" 라는 마법을 사용할 수 있고, MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.
   *  연습 1-2 에 선언한 Cleric 클래스에 “selfAid()” 메소드를 추가 하시오.
   *  또한, 이 메소드는 인수가 없고, 리턴 값도 없다.
   */
  void selfAid() {
    if (mp < 5) {
      print('MP 부족으로 실패하였습니다.');
    } else {
      mp -= 5;
      hp = MAX_OF_HP;
    }
  }
}
