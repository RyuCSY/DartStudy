import 'dart:math';

/**
 * 매운맛 - 슬라임 대전.
 */

// Npc 클래스.
class Npc {
  //이름
  String name;
  //생명력
  int health;
  //공격력
  int attack;
  //방어력
  int defense;

  Npc(this.name, this.health, this.attack, this.defense);

  /**
   * 공격 받는 함수. 파라미터 = 공격자.
   */
  void hit(Npc attacker) {
    int damage = attacker.attack - defense;
    if (damage < 0) damage = 0;

    health -= damage;

    print('${attacker.name} attacks the ${name}!');
    print('${name} takes ${damage} damage.');
  }

  @override
  String toString() {
    return '$name - Health: $health, Attack: $attack, Defense: $defense';
  }
}

void findWinner(Npc npc1, Npc npc2){
  if (npc1.health > 0) {
    print('\n${npc2.name} is defeated! ${npc1.name} wins!');
  } else {
    print('\n${npc1.name} is defeated! ${npc2.name} wins!');
  }
}

main() {
  var hero = Npc('Hero', 100, 10, 1);
  var slime = Npc('Slime', 10, 10, 5);

  print('${hero.name} vs ${slime.name}');

  while (hero.health > 0 && slime.health > 0) {
    print('\n$hero');
    print(slime);
    hero.hit(slime);
    slime.hit(hero);
  }

  findWinner(hero, slime);

}
