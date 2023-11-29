//Hint 2 내용 추가.
main() {
  List<String> players = ['player1', 'player2', 'player3', 'player4'];

  int currentplayerindex = 0;
  int clapcount = 0;
  int roolcount = 0;
  int ahhcount = 0;

  List<int> clapcountsbyplayer = [0, 0, 0, 0];

  for (int i = 1; i <= 100; i++) {
    String currentplayer = players[currentplayerindex];

    if (i % 30 == 0) {
      ahhcount++;
      print('$currentplayer : ahh');
    } else if (i % 3 == 0) {
      print('$currentplayer : clap');
      clapcount++;
      clapcountsbyplayer[currentplayerindex]++;
    } else if (i % 10 == 0) {
      roolcount++;
      print('$currentplayer : rool');
    } else {
      print('$currentplayer : $i');
    }
    currentplayerindex = (currentplayerindex + 1) % players.length;
  }


  print('\nclap 의 총 갯수 : ${clapcount}');
  print('rool 의 총 갯수 : ${roolcount}');
  print('ahh 의 총 갯수 : ${ahhcount}');

  int maxclapcnt = 0;
  String playerwithmaxclap = '';

  for (int i = 0; i < players.length; i++) {
    int cnt = clapcountsbyplayer[i];
    print('${players[i]} : $cnt');

    if (cnt > maxclapcnt) {
      maxclapcnt = cnt;
      playerwithmaxclap = players[i];
    }
  }
  print('\n가장 많은 clap을 출력한 플레이어 : ${playerwithmaxclap}');

}
