/**
 * static 에 누적값을 기록한 방식.
 */
class Player {
  static int totAhh = 0;
  static int totClap = 0;
  static int totRool = 0;

  String name;
  int ahh = 0;
  int clap = 0;
  int rool = 0;

  Player(this.name);

  void say(int inputNum) {
    if (inputNum % 30 == 0) {
      ahh++;
      totAhh++;
      print("$name : ahh");
    } else if (inputNum % 3 == 0) {
      clap++;
      totClap++;
      print("$name : clap");
    } else if (inputNum % 10 == 0) {
      rool++;
      totRool++;
      print("$name : rool");
    } else {
      print("$name : $inputNum");
    }
  }
}

main() {
  var playerArr = [
    new Player("Player1"),
    new Player("Player2"),
    new Player("Player3"),
    new Player("Player4")
  ];

  for (int i = 1; i <= 100; i++) {
    int playIndex = (i - 1) % 4;
    playerArr[playIndex].say(i);
  }

  print("\nclap 의 총 갯수 : ${Player.totClap}");
  print("rool 의 총 갯수 : ${Player.totRool}");
  print("ahh 의 총 갯수 : ${Player.totAhh}");

  var topScorer = playerArr[0];

  for (var player in playerArr) {
    print("${player.name} : ${player.clap}");
    if (player.clap > topScorer.clap) {
      topScorer = player;
    }
  }

  print("가장 많은 clap 을 출력한 플레이어 : ${topScorer.name}");
}
