import 'dart:math';

import 'starcraft.dart';

/// 저그유닛 클래스.
class ZergUnit extends Zerg implements Unit {
  ZergUnit(super.name) {
    created();
  }

  @override
  void created() {
    print('라바가 진화해서 ${name} 탄생!!');
  }

  @override
  void death() {
    print('${name} 죽었다.');
  }
}

/// 테란 기계 유닛의 부모 클래스.
class TerranMechanicUnit extends Terran with Machine implements Unit {
  TerranMechanicUnit(super.name) {
    created();
  }

  var mentList = [
    '완성 !! 출격 준비 완료!!',
    '출격하라!!!',
    '기계는 무적이다!!',
  ];

  @override
  void created() {
    print('${name}의 외침 : "${mentList[Random().nextInt(mentList.length)]}"');
  }

  @override
  void death() {
    print('${name} 파괴됐다.');
  }
}

/// 테란 생체 유닛의 부모 클래스.
class TerranBionicUnit extends Terran with Bionic implements Unit {
  TerranBionicUnit(super.name) {
    created();
  }

  var mentList = [
    '훈련을 마치고, 전장에 투입 준비가 완료했습니다!!',
    '임무를 내려 주세요!!',
    '맡겨만 주십시오!!',
    '테란이여 영원하라!!',
  ];

  @override
  void created() {
    print('${name} 도착 - "${mentList[Random().nextInt(mentList.length)]}"');
  }

  @override
  void death() {
    print('${name} 사망.');
  }
}

/// 프로토스 생명체 유닛의 부모 클래스.
class ProtossBionicUnit extends Protoss with Bionic implements Unit {
  ProtossBionicUnit(super.name);

  var mentList = [
    '프로토스를 위하여!!!',
    '아둔에 영광을!!!',
    '프로토스!!',
  ];

  @override
  void created() {
    print('${name} 소환완료 >> "${mentList[Random().nextInt(mentList.length)]}"');
  }

  @override
  void death() {
    print('${name} 증발하여 아둔의 성지로 가버렸다..');
  }
}

/// 프로토스 기계유닛의 부모 클래스.
class ProtossMechanicUnit extends Protoss with Machine implements Unit {
  ProtossMechanicUnit(super.name);

  var mentList = [
    '프로토스를 위하여!!!',
    '아둔에 영광을!!!',
    '프로토스!!',
  ];

  @override
  void created() {
    print('${name} 대사 : "${mentList[Random().nextInt(mentList.length)]}"');
  }

  @override
  void death() {
    print('${name} 증발하여 아둔의 성지로 가버렸다..');
  }
}

/// 테란의 기계 유닛 벌처.
class Vulture extends TerranMechanicUnit {
  Vulture() : super('벌처');
}

/// 테란의 기계 유닛 탱크.
class Tank extends TerranMechanicUnit {
  Tank() : super('탱크');
}

/// 테란의 상체 유닛 마린.
class Marine extends TerranBionicUnit {
  Marine() : super('마린');
}

/// 프로토스의 기계 유닛 드라군.
class Dragun extends ProtossMechanicUnit {
  Dragun() : super('드라군');
}

/// 프로토스의 상체 유닛 질럿.
class Zealot extends ProtossBionicUnit {
  Zealot() : super('질럿');
}
