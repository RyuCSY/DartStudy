main() {
  String strSource = '11.1';
  int num = 0;

  try {
    num = int.parse(strSource);
  } catch (e) {
    // num = 0;
    // print(e);
  }

  print(num);
}
