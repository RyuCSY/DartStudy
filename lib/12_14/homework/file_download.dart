import 'dart:io';

import 'package:dart_exam/12_14/homework/get_movie.dart';
import 'package:dart_exam/12_14/homework/utils/random_downloader.dart';
import 'package:dart_exam/12_14/homework/utils/file_downloader.dart' as fileDownloader;

import 'package:path/path.dart';

main() async {
  await measureTime(practice4());

  ImageRandomDownloader randomDownloader = ImageRandomDownloader(await getMovieData());

  await measureTime(practice5(randomDownloader));

  await measureTime(practice5Phase2(randomDownloader));

  print(await practice6());
}

Future<void> measureTime(Future<String> future) async {
  final stopwatch = Stopwatch();
  stopwatch.start();
  await future.then((s) => print('${s}소요시간 : ${Duration(milliseconds: stopwatch.elapsedMilliseconds)}'));
}

Future<String> practice4() => Future.sync(() async {
      File imgFile = await fileDownloader.downloadFile(fileDownloader.default_url);
      print('연습문제 3. 사진 다운로드. ${imgFile.absolute.path} ${imgFile.lengthSync()} bytes');
      print('\n연습문제 4.  다운로드 시간, 용량 표시');
      print('용량 : ${await imgFile.length()} bytes');
      return '';
    });

Future<String> practice5(ImageRandomDownloader random) => Future.sync(() async {
      print('\n5-1 순차적 다운 시작');
      for (int i = 0; i < 3; i++) {
        printFileInfo(await random.download());
      }

      return '순차적 ';
    });

Future<String> practice5Phase2(ImageRandomDownloader random) => Future.sync(() async {
      print('\n5-2 병렬 다운 시작');
      var imgList = await [
        random.download(),
        random.download(),
        random.download(),
      ].wait;

      imgList.forEach(printFileInfo);
      return '병렬 ';
    });

Future<String> practice6() => Future.sync(() async {
      print('\n연습문제 6: 에러 처리');
      var imgFile = await fileDownloader.downloadFile('http://123123.jpg');
      return '연습문제 6 결과 : ${imgFile.absolute.path} ${imgFile.lengthSync()} bytes';
    });

void printFileInfo(File imgFile) {
  print('용량 : ${imgFile.lengthSync()} bytes, \t ${basename(imgFile.path)} ');
}
