import 'name_owner.dart';
import 'wand.dart';

/// 연습문제 10-1. 다음 2개의 클래스 “Wizard (마법사)”, “Wand (지팡이)” 를 작성하시오. 마법사는 지팡이를 들 수 있습니다.
class Wizard extends NameOwner {
  // 체력
  int _hp;

  // 마나.
  int _mp;

  //조건 3. 마법사의 지팡이는 null 일 수 없다. ? 제거. Wand? >> Wand
  // 지팡이
  Wand wand;

  int get hp => _hp;

  int get mp => _mp;

  Wizard(
    String name, {
    required int hp,
    required int mp,
    required this.wand,
  })  : _hp = hp,
        _mp = mp,
        super(name) {

    //조건 4. 마법사의 MP는 0 이상이어야 한다.
    if (_mp < 0) {
      throw Exception('마법사의 MP는 0 이상 이어야 합니다. ');
    }
    //조건 5. HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)
    _hp = (_hp < 0) ? 0 : _hp;
  }

  @override
  String toString() {
    return '${super.toString()} hp: $_hp, mp: $_mp, wand: $wand}';
  }
}
