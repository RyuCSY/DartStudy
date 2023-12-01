//player 구조체.
class Player {
  // 이름.
  String name;
  // ahh 횟수.
  int ahh = 0;
  // clap 횟수.
  int clap = 0;
  // rool 횟수.
  int rool = 0;

  //생성자.
  Player(this.name);

  //3,6,9 게임 규칙에 의한 말하기 함수.
  void say(int inputNum) {
    if (inputNum % 30 == 0) {
      //30의 배수인 경우.
      ahh++;
      print("$name : ahh");
    } else if (inputNum % 3 == 0) {
      //3의 배수인 경우.
      clap++;
      print("$name : clap");
    } else if (inputNum % 10 == 0) {
      //10 의 배수인 경우.
      rool++;
      print("$name : rool");
    } else {
      print("$name : $inputNum");
    }
  }
}

main() {
  //4명의 player 생성.
  var playerArr = [
    new Player("Player1"),
    new Player("Player2"),
    new Player("Player3"),
    new Player("Player4")
  ];

  //숫자 100까지 게임 진행.
  for (int i = 1; i <= 100; i++) {
    int playIndex = (i - 1) % 4;
    playerArr[playIndex].say(i);
  }

  //총 갯수 변수 선언.
  int totAhh = 0;
  int totClap = 0;
  int totRool = 0;

  for (var player in playerArr) {
    //총 갯수 변수 합산.
    totAhh += player.ahh;
    totClap += player.clap;
    totRool += player.rool;
  }

  print("\nclap 의 총 갯수 : ${totClap}");
  print("rool 의 총 갯수 : ${totRool}");
  print("ahh 의 총 갯수 : ${totAhh}");

  var topScorer = playerArr[0];

  //가장 많은 clap player 찾기.
  for (var player in playerArr) {
    print("${player.name} : ${player.clap}");
    if (player.clap > topScorer.clap) {
      topScorer = player;
    }
  }

  print("가장 많은 clap 을 출력한 플레이어 : ${topScorer.name}");
}
