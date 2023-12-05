import 'computer.dart';
import 'assets/tangible_asset.dart';

main() {
  // TangibleAsset 를 상속받은 Computer 는 객체생성 성공.
  Computer pc = Computer(name: 'name', price: 1111, color: 'color', maker: 'LG');
  // print('pc.getWeight() = ${pc.getWeight()}'); 무게 미 설정 시 에러 방생.
  pc.setWeight(10.5);
  print('pc.getWeight() = ${pc.getWeight()}');

  // TangibleAsset 자체는 생성자가 있지만, 객체생성 실패.
  // TangibleAsset asset = TangibleAsset(name: 'name', price: 1111, color: 'color');
}
