import 'starcraft.dart';

/// 테란의 건물을 의미합니다.
///
/// * [SCV] 가 수리를 할 수 있습니다.
///
class TerranBuilding extends Terran with Machine implements Building {
  TerranBuilding(super.name) {
    build();
  }

  @override
  void build() {
    print('$name 건설 성공!!!');
  }

  @override
  void destroy() {
    print('$name 붕괴됐습니다.');
  }
}

/// 저그의 건물을 의미합니다.
///
/// 건물도 저그를 상속받아 생명체로 인정됩니다.
/// * [Medic] 이 치료 할 수 없습니다.
///
class ZergBuilding extends Zerg implements Building {
  ZergBuilding(super.name) {
    build();
  }

  @override
  void build() {
    print('드론이 변태하여 $name 탄생!!!');
  }

  @override
  void destroy() {
    print('$name 파괴됐다!!!');
  }
}

/// 프로토스의 건물을 의미합니다.
///
class ProtossBuilding extends Protoss implements Building {
  ProtossBuilding(super.name) {
    build();
  }

  @override
  void build() {
    print('$name 소환에 성공했습니다.');
  }

  @override
  void destroy() {
    print('$name 박살났습니다.');
  }
}