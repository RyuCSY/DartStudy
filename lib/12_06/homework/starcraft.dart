import 'dart:math';

import 'starcraft_buildings.dart';
import 'starcraft_units.dart';

const int MAX_POINT = 100;

const int MIN_HP = 20;
const int MIN_MP = 10;

const int DEFAULT_HP = 50;
const int DEFAULT_MP = 40;

/// 건물이 아닌 유닛을 의미합니다.
abstract interface class Unit {
  /// 유닛이 생산됐을때 호출돼야 합니다. 객체의 생성자에서 호출을 권장합니다.
  void created();

  /// 유닛이 소멸했을 때 호출돼야 합니다.
  void death();
}

/// 유닛이 아닌 건물을 의미합니다.
abstract interface class Building {
  /// 건물이 완성됐을 때 호출돼야 합니다. 객체의 생성자에서 호출을 권장합니다.
  void build();

  /// 건물이 파괴됐을때 호출돼야 합니다.
  void destroy();
}

/// 기계가 아닌 생물을 의미합니다.
///
/// ```
///
/// 생물은 유닛과 건물을 가리지 않고, 유연하게 응용 가능합니다.
/// 최초 interface 로 개발했지만, mixin 이 더 타당하다 판단하여 수정됐습니다.
/// ```
///
mixin Bionic on StarcraftObject {
  /// 힐러에게 회복을 받는다.
  int receiveTreatment(Medic healer) {
    return healer.heal(this);
  }
}

/// 생물이 아닌 기계를 의미합니다.
///
/// ```
///
/// 기계는 유닛과 건물을 가리지 않고, 유연하게 응용 가능합니다.
/// 최초 interface 로 개발했지만, mixin 이 더 타당하다 판단하여 수정됐습니다.
/// ```
///
mixin Machine on StarcraftObject {
  /// SCV에게 수리를 받는다.
  int receiveRepair(SCV repairman) {
    return repairman.repair(this);
  }
}

/// 스타크래프트 관련 최상위 객체.
///
/// 모든 스타크래프트 객체는 필수적으로 [name] 과 [_hp] 를 가집니다.
/// ```
/// 이름은 한번 정해지면 수정이 불가하며, 체력은 외부에서 수정이 불가합니다.
/// ```
///
class StarcraftObject {
  final String name;
  int _hp;

  // TODO protected 접근 제한자가 있었다면, 해당 파일에 유닛이 있을 이유가 없다. setter 호출은 특정에게만 제한방법이 있는가? 연구 필요.

  int get hp => _hp;

  StarcraftObject(
    this.name, {
    int hp = DEFAULT_HP,
  }) : _hp = hp;
}

/// 모든 테란 객체의 부모.
///
/// 테란의 유닛과 건물은 모두 테란을 상속받게 되어있습니다.
/// 테란의 모든 객체는 [Terran] 의 다형성을 가집니다.
///
class Terran extends StarcraftObject {
  Terran(super.name);
}

/// 모든 저그 객체의 부모.
///
/// 요구사항=유닛, 건물 모두 생물, 자동 회복 기능, 메딕 치료 불가.
///
class Zerg extends StarcraftObject with Bionic {
  Zerg(super.name);

  /// 자동 회복 함수.
  void hpRecovery() {
    _hp++;
  }
}

/// 모든 프로토스 객체의 부모.
///
/// 요구사항=유닛, 건물 모두 방어막 소유 및 자동회복 가능.
///
class Protoss extends StarcraftObject {
  ///방어막.
  int _shield;

  int get shield => _shield;

  Protoss(
    super.name, {
    int shield = MAX_POINT,
  }) : _shield = shield;

  /// 방어막 자동회복 함수.
  void shieldRecovery() {
    _shield++;
  }
}

/// 테란의 회복용 생체 유닛.
///
/// ```
///
/// Medic은 생물유닛과 SCV 를 치료할 수 있습니다.
/// Zerg 종족은 모든 유닛과 건물이 생물로 구성되어 있습니다.
/// 하지만 테란의 Medic이 건물은 치료할 수 없습니다.
/// ```
/// * [Bionic] 는 생물입니다. 해당 코드를 참고하세요.
/// * [SCV] 는 해당 코드를 참고하세요.
///
class Medic extends TerranBionicUnit {
  int _mp = DEFAULT_MP;

  int get mp => _mp;

  Medic() : super('메딕');

  int heal(Bionic target) {
    int retVal = 0;

    if (target is Building) {
      print('잘못된 대상 입니다.');
      retVal = 0;
    } else {
      if (_mp < 0) {
        print('mp가 부족 합니다.');
        retVal = 0;
      } else {
        int beforeHp = target.hp;
        int pain = MAX_POINT - beforeHp;

        if (_mp >= pain) {
          retVal = pain;
          _mp -= pain;
        } else {
          retVal = _mp;
          _mp -= retVal;
        }
        target._hp += retVal;
      }
    }

    return retVal;
  }
}

/// 테란의 일꾼 유닛.
/// ```
/// SCV는 일꾼 유닛으로 자원을 채취할 수 있으며, 기계 유닛의 수리를 할 수 있습니다.
/// 문서에 명시되어 있지 않지만, 구두 요청사항은 아래와 같습니다.
///
/// -테란 이외의 기계 유닛의 수리는 불가하다.
/// -건물은 유닛이 아니지만, 수리가 가능하다. 역시 테란의 건물만 적용된다.
/// ```
///
/// * [Machine] 기계 유닛과 건물을 가리지 않고, 유연한 구조로 설계됐습니다.
///
class SCV extends TerranMechanicUnit with Bionic {
  SCV() : super('SCV');

  void extractResource() {
    print('SCV 가 자원을 채취했습니다.');
  }

  int repair(Machine target) {
    int retVal = 0;

    if (target is Terran) {
      int beforeHp = target.hp;
      int pain = MAX_POINT - beforeHp;

      retVal = Random().nextInt(pain + 1);
      target._hp += retVal;
    } else {
      print('잘못된 대상 입니다.');
      retVal = 0;
    }
    return retVal;
  }
}

///
///
///
/// 이하 테스트를 위한 코드.
// TODO 객체 생성시(생성자에서) 난수 호출방법이 없을까? 연구 필요.
Medic genTesterMedic() {
  Medic ret = Medic();
  ret._mp = MIN_MP + Random().nextInt(MAX_POINT - MIN_MP);
  return ret;
}

ZergUnit genZergTester() {
  var names = ['저글링', '히드라', '오버로드', '울트라 리스크'];
  ZergUnit ret = ZergUnit(names[Random().nextInt(names.length)]);
  ret._hp = MIN_HP + Random().nextInt(MAX_POINT - MIN_HP);
  return ret;
}

TerranBuilding genTerranBuildingTester() {
  var names = ['커멘드 센터', '배럭스', '팩토리', '스타포트'];
  TerranBuilding ret = TerranBuilding(names[Random().nextInt(names.length)]);
  ret._hp = MIN_HP + Random().nextInt(MAX_POINT - MIN_HP);
  return ret;
}

ZergBuilding genZergBuildingTester() {
  var names = ['헤처리', '스포닝풀', '히드라덴', '크립 콜로니', '스파이어'];
  ZergBuilding ret = ZergBuilding(names[Random().nextInt(names.length)]);
  ret._hp = MIN_HP + Random().nextInt(MAX_POINT - MIN_HP);
  return ret;
}

ProtossBuilding genProtossBuilding() {
  var names = ['넥서스', '파일론', '게이트웨이', '사이버 넥티스 코어', '아둔의 성지'];
  ProtossBuilding ret = ProtossBuilding(names[Random().nextInt(names.length)]);
  ret._hp = MIN_HP + Random().nextInt(MAX_POINT - MIN_HP);
  return ret;
}
