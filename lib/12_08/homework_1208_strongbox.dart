/// 단, 열쇠의 종류는 다음 4종류로 한정한다. 각 열쇠는 사용횟수의 한도가 정해져 있다.
//
//
// padlock    (1,024회)
// button      (10,000회)
// dial             (30,000회)
// finger       (1,000,000회)
enum KeyType {
  // 2번만에 열리는 test 용도...
  test(2),
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int cnt;

  const KeyType(this.cnt);
}

/// 연습문제 1에서 작성한 StrongBox 클래스에 열쇠의 종류를 나타내는 열거형 KeyType을 정의하고,
/// 다음 내용을 반영하여 StrongBox 클래스를 수정하시오.
///열쇠의 종류를 나타내는 필드 변수
// 열쇠의 종류를 받는 생성자
///
class StrongBox {
  Object? _data;
  KeyType keyType;
  int useCnt = 0;

  StrongBox(this.keyType);

  /// 금고에서 get() 메서드를 호출할 때 마다 사용횟수를 카운트하고 각 열쇠의 사용횟수에 도달하기 전에는 null을 리턴한다.
  Object? get() => (++useCnt > keyType.cnt) ? _data : null;

  void put(Object value) {
    _data = value;
  }
}

main() {
  StrongBox strongBox = StrongBox(KeyType.test);
  String treasure = '보물 원피스';

  strongBox.put(treasure);

  for (int i = 0; i < 4; i++) {
    print(strongBox.get());
  }
}
