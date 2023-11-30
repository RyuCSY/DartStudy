import 'cleric_test.dart';

/**
 * Cleric 테스트 클래스.
 */
main() {
  Cleric cleric = Cleric('전광훈');

  for (int i = 0; i < 5; i++) {
    cleric.selfAid();
  }

  for (int i = 0; i < 11; i++) {
    cleric.pray(i);
  }

  print('\n\n기도가 하늘에 닿아 사랑 제일교회 가 멸망하였다.');

}
