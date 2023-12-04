import 'wand.dart';
import 'wizard.dart';

main() {
  //조건 1 검증. 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
  // Wizard(null, hp: 50, mp: 10 , wand : Wand(null, power: 5));
  // Wizard('1234', hp: 50, mp: 10 , wand : Wand('12', power: 5));
  // Wizard('12', hp: 50, mp: 10 , wand : Wand('1234', power: 5));


  //조건 2 검증. 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  // Wand('화염 지팡이', power: 0.4);
  // Wand('화염 지팡이', power: 100.1);

  //조건 3 검증. 마법사의 지팡이는 null 일 수 없다..
  // Wizard('화염 마법사', hp: 50, mp: 10 , wand : null); // wand 를 null 로 지정.
  // Wizard('화염 마법사', hp: 50, mp: 10 ); // wand 가 없음.

  //조건 4 검증. 마법사의 MP는 0 이상이어야 한다.
  // Wizard('화염 마법사', hp: 50, mp: -1 , wand : Wand('화염 지팡이', power: 5));

  //조건 5 검증. HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)
  print(Wizard('화염 마법사', hp: -50, mp: 10 , wand : Wand('화염 지팡이', power: 5)));

}