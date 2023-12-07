import 'dart:io';
import 'dart:math';

import 'starcraft.dart';
import 'starcraft_buildings.dart';
import 'starcraft_units.dart';

main() {
   logicTest();
}

void healTest(Bionic target){
  Medic medic = Medic();

  print('\nmp ${medic.mp} 를 보유한 메딕이 hp ${target.hp} 가지고 있는 ${target.name} 회복시도.');
  int value = medic.heal(target);
  print('${value} 회복 후 메딕의 mp ${medic.mp}, ${target.name}  의 hp ${target.hp} .\n');
}

void repairTest(Machine target){
  SCV scv = SCV();

  print('\n${scv.name}가 hp ${target.hp} 가지고 있는 ${target.name} 회복시도.');
  int value = scv.repair(target);
  print('${value} 회복 후 ${target.name} 의 hp ${target.hp} .\n');
}

void logicTest() {

  SCV scv = SCV();

  // 검증
  // SCV는 일꾼 유닛으로 자원을 채취할 수 있으며, 기계 유닛의 수리를 할 수 있습니다.
  scv.extractResource();

  Tank tank = Tank();
  repairTest(tank);

  // 검증
  // SCV는 테란의 건물 수리를 할 수 있습니다.
  TerranBuilding factory = TerranBuilding('팩토리');
  repairTest(factory);

  // 검증
  // Medic은 생물유닛과 SCV 를 치료할 수 있습니다.
  healTest(scv);
  healTest(Marine());

  // 검증
  // Medic은 Zerg 종족 건물을 치료할 수 있습니다.
  ZergBuilding hatchery = ZergBuilding('해처리');
  healTest(hatchery);

  // Medic의 테란 이외의 종족 치료 검증.
  Zealot zealot = Zealot();
  healTest(zealot);

  Dragun dragun = Dragun();
  // healTest(dragun); // dragun 은 기계라서 호출불가.

  // 검증 서로 수리
  repairTest(SCV());
  healTest(scv);

}

void unitTest() {
  testHeal(testInstance());
  testRepair(testInstance());
}

void testBuilding() {
  List<Building> list = [];
  Random random = Random();

  for (int i = 0; i <= 66; i++) {
    int num = random.nextInt(5);

    if (num == 0) {
      list.add(genTerranBuildingTester());
    } else if (random.nextInt(11) % 2 == 0) {
      list.add(genZergBuildingTester());
    } else {
      list.add(genProtossBuilding());
    }
  }
  print(list);
}

void testHeal(List<Unit> list) {
  Medic healer1 = genTesterMedic();
  Medic healer2 = genTesterMedic();
  Medic healer3 = genTesterMedic();

  for (int i = 0; i <= 3; i++)
    list.forEach((unit) {
      StarcraftObject obj = unit as StarcraftObject;

      if (unit is Bionic) {
        print('${obj.name}  회복시도. = ${obj.hp}');

        Bionic target = unit as Bionic;
        int a = healer1.heal(target);
        print(
            '남은mp ${healer1.mp} healer1 은 ${obj.name} hp 를 $a 만큼 회복. = ${obj.hp}');

        int b = healer2.heal(target);
        print(
            '남은mp ${healer2.mp} healer2 는 ${obj.name} hp 를 $b 만큼 회복. = ${obj.hp}');

        int c = healer3.heal(target);
        print(
            '남은mp ${healer3.mp} healer3 은 ${obj.name} hp 를 $c 만큼 회복. = ${obj.hp}');
      }
    });
}

void testRepair(List<Unit> list) {
  SCV scv = SCV();

  for (int i = 0; i <= 3; i++)
    list.forEach((unit) {
      StarcraftObject obj = unit as StarcraftObject;

      if (unit is Bionic) {
        if (unit is Machine) {
          print('${obj.name}  회복시도. = ${obj.hp}');

          Machine target = unit as Machine;
          int re = scv.repair(target);
          print('scv 가 ${obj.name} hp 를 $re 만큼 회복. = ${obj.hp}');
        }
      }
    });
}

List<Unit> testInstance() {
  List<Unit> list = [];

  for (int i = 0; i <= 11; i++) {
    list.add(genZergTester());
  }
  list.add(Vulture());
  list.add(Tank());
  list.add(Marine());
  list.add(genTesterMedic());
  list.add(SCV());
  list.add(Zealot());
  list.add(Dragun());

  return list;
}
