import 'dart:convert';

import 'package:dart_exam/12_14/homework/models/mask_info.dart';
import 'package:http/http.dart' as http;

const url = 'http://104.198.248.76:3000/mask';

main() async {
  MaskInfo maskInfoList = await getMaskInfo();
  // 위 링크를 참고하여 마스크 정보를 읽어오고
  // 적절한 모델 클래스를 작성하여 List 에 담고 출력하는 프로그램을 작성하시오
  // 단, 불완전한 정보가 있는 데이터는 출력하지 않습니다.
  print('\n연습문제 7 ');
  maskInfoList.stores.forEach((store) {
    if (!store.hasNull) {
      print(store);
    }
  });
}

Future<MaskInfo> getMaskInfo() async {
  var res = await http.get(Uri.parse(url));
  return MaskInfo.fromJson(jsonDecode(utf8.decode(res.body.runes.toList())));
}
