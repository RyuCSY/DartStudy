import 'name_owner.dart';

const double MIN_VALUE = 0.5;
const double MAX_VALUE = 100;

/// 연습문제 10-1. 다음 2개의 클래스 “Wizard (마법사)”, “Wand (지팡이)” 를 작성하시오. 마법사는 지팡이를 들 수 있습니다.
class Wand extends NameOwner {
  // 마력
  double _power;

  Wand(
    String name, {
    required double power,
  })  : _power = power,
        super(name){
    //조건 2. 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
    if(MIN_VALUE > _power || MAX_VALUE < _power ){
      throw Exception('마력은 $MIN_VALUE 이상 $MAX_VALUE  이하 여야 합니다. 입력된 값 : $_power ');
    }
  }

  @override
  String toString() {
    return '${super.toString()} power: $_power}';
  }
}
