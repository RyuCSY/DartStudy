//흰트 1 공개 내용.
main() {
  List<String> players = ['Player1', 'Player2', 'Player3', 'Player4'];

  int currentPlayerIndex = 0;
  int clapCount = 0;
  int roolCount = 0;
  int ahhCount = 0;

  List<int> clapCountsByPlayer = [0, 0, 0, 0];

  for (int i = 1; i <= 100; i++) {
    int playIndex = (i - 1) % 4;
    String currentPlayer = players[currentPlayerIndex];
  }
}
