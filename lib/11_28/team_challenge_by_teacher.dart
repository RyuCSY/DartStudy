//Hint 2 내용 추가.
main() {
  List<String> players = ['Player1', 'Player2', 'Player3', 'Player4'];

  int currentPlayerIndex = 0;
  int clapCount = 0;
  int roolCount = 0;
  int ahhCount = 0;

  List<int> clapCountsByPlayer = [0, 0, 0, 0];

  for (int i = 1; i <= 100; i++) {
    String currentPlayer = players[currentPlayerIndex];

    if (i % 30 == 0) {
      ahhCount++;
      print("$currentPlayer : ahh");
    } else if (i % 3 == 0) {
      clapCount++;
      print("$currentPlayer : clap");
    } else if (i % 10 == 0) {
      roolCount++;
      print("$currentPlayer : rool");
    } else {
      print("$currentPlayer : $i");
    }
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
  }

  print("\nclap 의 총 갯수 : ${clapCount}");
  print("rool 의 총 갯수 : ${roolCount}");
  print("ahh 의 총 갯수 : ${ahhCount}");
}
