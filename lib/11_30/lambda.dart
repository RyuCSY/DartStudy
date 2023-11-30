void main() {
  List<int> intList = [1, 2, 3, 4, 5];
  String out = '';

  for (int integer = 0; integer < intList.length; integer++) {
//integer == 0, 1, 2, 3, 4 각 각
    out += '$integer, ';
  }
  print(out);
  out = '';
  for (int integer in intList) {
//integer == 1, 2, 3, 4, 5 각 각
    out += '$integer, ';
  }
  print(out);
  out = '';
  intList.forEach((integer) {
//integer == 1, 2, 3, 4, 5 각 각
    out += '$integer, ';
  });
  print(out);
  out = '';
//람다식
  intList.where((num) => num.isEven).forEach((integer) => out += '$integer, '); //integer == 2, 4,  각 각
  print(out);

  //forEach where 등 list 관련 함수 공부 필요.
}
