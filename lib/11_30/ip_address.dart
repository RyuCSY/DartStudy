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
  // input 에 '.' 이 없다면 false 리턴.
  if (!input.contains('.')) {
    return false;
  } else {
    var sp = input.split('.');
    // input 에 '.' 이 3개가 아니라면 false 리턴.
    if (sp.length != 4) {
      return false;
    } else {
      for (String s in sp) {
        // '.'으로 분리한 각 값이 0~255 사이인지 체크.
        try {
          var temp = int.parse(s);
          if (temp >= 0 && temp <= 255) {
            continue;
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
