import 'dart:io';

/**
 * 중간맛 - ip address.
 */
main() {
  var inputArr = ['', '', '', ''];

  for (int i = 0; i < 4; i++) {
    print('${i + 1} 번째 주소를 입력하세요.');
    inputArr[i] = stdin.readLineSync()!;
  }

  for (String s in inputArr) {
    print('$s \t ${isPass(s)}');
  }
}

bool isPass(String input) {
  if (!input.contains('.')) {
    return false;
  } else {
    var sp = input.split('.');
    if (sp.length != 4) {
      return false;
    } else {
      for (String s in sp) {
        try {
          var temp = int.parse(s);
          if (temp >= 0 && temp <= 255) {
            return true;
          } else {
            return false;
          }
        } catch (e) {
          return false;
        }
      }
    }
  }
  return true;
}
