main() {
  String strSource = '11';
  int num = 0;

  try {
    num = int.parse(strSource);
  } catch (e) {
    print('$strSource 은 올바른 정수가 아니므로 0으로 치환 됩니다.');
    // num = 0;
    // print(e);
  }

  print(num);
}
