import 'cleric.dart';

/**
 * Cleric 테스트 클래스.
 */
main() {
  [
    // A) 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
    Cleric('1서스', hp: 100, mp: 100),
    // B) 이 클래스는 Cleric(“아서스", 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다. 이 때, MP는 최대 MP와 같은 값이 초기화 된다
    Cleric('2서스', hp: 4),
    // C) 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다. 이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
    Cleric('3서스', mp: 4),
    // D) 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다. (이름이 없는 성직자는 존재 할 수 없음)
    Cleric('4서스'),
  ].forEach((cleric) {print(cleric);});
}
