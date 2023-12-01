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
  intList
      .where((num) => num.isEven)
      .forEach((integer) => out += '$integer, '); //integer == 2, 4,  각 각
  print(out);

  //forEach where 등 list 관련 함수 공부 필요.

  print(add(3, 4));
  print(addLambda(3, 4));
}

int add(int a, int b) {
  return a + b;
}

//한줄짜리 함수는 바디 없이 람다로 대체 가능.
int addLambda(int a, int b) => a + b;
