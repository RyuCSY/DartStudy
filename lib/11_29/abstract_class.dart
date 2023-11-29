//추상클래스를 사용하여 IronMan Class에 method를 구현하기
abstract class IronMan {
  String name;
  String suitColor;

  IronMan(this.name, this.suitColor);

  void fly();

  void shootLasers();

  void withstandDamage();
}

//@override 구문을 사용하여 abstract method 구현
class Mark50 extends IronMan {
  Mark50(super.name, super.suitColor);

  @override
  void fly() {
    print('$name is flying ');
  }

  @override
  void shootLasers() {
    print('$name is shooting Laser!');
  }

  @override
  void withstandDamage() {
    print('$name withstand Damage ');
  }
}

void main() {
  var mark50 = Mark50('Mark50', 'red');
  mark50.shootLasers();
}
