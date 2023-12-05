import 'slime.dart';

class Hero {
  String name;
  int _hp;

  bool get isSurvivor => _hp > 0;

  int get hp => _hp;

  Hero(this.name, this._hp);

  void attack(Slime slime) {
    print('$name이 $slime을 공격!!');
    slime.hp -= 10;
  }

  void run() {
    print('$name이 도주!!');
  }

  void printHp() {
    print('${name} hp = ${hp}');
  }

  void damage(int value) {
    if (isSurvivor) {
      _hp -= value;
      if (_hp < 0) {
        _hp = 0;
        print('$name 사망!!');
      }
    } else {
      print('$name 이미 사망!!');
    }
  }
}

class SuperHero extends Hero {
  SuperHero(super.name, super.hp);

  bool _isFlying = false;

  bool get isFlying => _isFlying;

  set isFlying(bool value) {
    _isFlying = value;
    print('$name이 날개를 ${value ? '펼쳤다.' : '접었다.'}');
  }

  @override
  void run() {
    print('$name이 ${isFlying ? '날아서 ' : '걸어서 '} 퇴각!!');
  }

  @override
  void attack(Slime slime) {
    super.attack(slime);
    if (isFlying) {
      print('비행으로 인해 추가 피해를 입혔다.');
      slime.hp -= 5;
    }
  }
}

main() {
  Hero hero = Hero('홍길동', 100);
  hero.run();

  SuperHero superHero = SuperHero('한석봉', 50);
  superHero.run();
}
