import 'dart:io';
import 'dart:math';

import 'package:dart_exam/12_14/homework/get_movie.dart';
import 'package:http/http.dart' as http;

import 'models/movie_data.dart';
import 'package:path/path.dart';

const default_url = 'https://alimipro.com/favicon.ico';
const base_img_url = 'https://image.tmdb.org/t/p/w220_and_h330_face';
//const base_img_url = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2';

final stopwatch = Stopwatch();

main() async {
  File imgFile = File('icon.ico');
  stopwatch.start();
  imgFile = await downloadFile(default_url);
  print('연습문제 3. 사진 다운로드. ${imgFile.absolute.path} ${imgFile.lengthSync()} bytes');

  print('\n연습문제 4.  다운로드 시간, 용량 표시');
  showStopwatch();
  print('용량 : ${await imgFile.length()} bytes');

  _RandomUrlGenerator random = _RandomUrlGenerator(await getMovieData());
  print('\n연습문제 5 - 병렬처리');
  stopwatch.reset();
  stopwatch.start();

  print('\n5-1 순차적 다운 시작');
  for (int i = 0; i < 3; i++) {
    imgFile = await downloadRandomFile(random);
    print('${basename(imgFile.path)} \t / 용량 : ${await imgFile.length()} bytes');
  }

  showStopwatch(msg: '순차적 ');
  stopwatch.reset();
  stopwatch.start();

  print('\n5-2 병렬 다운 시작');
  var imgList = await [
    downloadRandomFile(random),
    downloadRandomFile(random),
    downloadRandomFile(random),
  ].wait;

  imgList.forEach((img) => print('${basename(img.path)} \t / 용량 : ${img.lengthSync()} bytes'));
  showStopwatch(msg: '병렬 ');

  print('\n연습문제 6: 에러 처리');
  imgFile = await downloadFile('http://123123.jpg');
  print('연습문제 6 결과 : ${imgFile.absolute.path} ${imgFile.lengthSync()} bytes');
}

void showStopwatch({String msg = ''}) =>
    print('${msg}소요시간 : ${Duration(milliseconds: stopwatch.elapsedMilliseconds).toString()}');

Future<File> downloadRandomFile(_RandomUrlGenerator random) async {
  _UrlItem item = random.nextItem();
  return await downloadFile(item.url, fileName: item.fName);
}

Future<File> downloadFile(String url, {String fileName = 'icon.ico'}) async {
  File imgFile = File(fileName);
  try {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      imgFile.createSync(recursive: true);
      await imgFile.writeAsBytes(res.bodyBytes);
    } else {
      throw Exception('file down failure.');
    }
  } on Exception {
    print('$url 경로 의 다운로드를 실패하여 기본값으로 다운로드를 시작합니다. ');
    return downloadFile(default_url);
  }

  return imgFile;
}

class _RandomUrlGenerator {
  final MovieData movieData;
  final Set<int> usedIndexSet = {};
  var index = 0;

  _RandomUrlGenerator(this.movieData);

  _UrlItem nextItem() {
    String url = '$base_img_url${genUrl()}';
    String fName = movieData.itemList?[index].title ?? '${DateTime.now().millisecondsSinceEpoch}';
    fName = 'lib/img/$fName.jpg';

    return _UrlItem(url: url, fName: fName);
  }

  String genUrl() {
    index = _randomByNonDuplicate(movieData.itemList?.length ?? 0);
    return movieData.itemList?[index].backdropPath ?? genUrl();
  }

  int _randomByNonDuplicate(int limit) {
    int retVal;
    do {
      retVal = Random().nextInt(limit);
    } while (usedIndexSet.contains(retVal));
    usedIndexSet.add(retVal);
    return retVal;
  }
}

class _UrlItem {
  final String url;
  final String fName;

  _UrlItem({
    required this.url,
    required this.fName,
  });
}
