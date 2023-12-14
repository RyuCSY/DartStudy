import 'dart:io';
import 'package:http/http.dart' as http;

const default_url = 'https://alimipro.com/favicon.ico';
const defaultFileName = 'icon.ico';

Future<File> downloadFile(String url, {String fileName = defaultFileName}) async {
  File targetFile = File(fileName);
  try {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      targetFile.createSync(recursive: true);
      await targetFile.writeAsBytes(res.bodyBytes);
    } else {
      throw Exception('file down failure.');
    }
  } on Exception {
    print('$url 경로 의 다운로드를 실패하여 기본값으로 다운로드를 시작합니다. ');
    return downloadFile(default_url);
  }

  return targetFile;
}
