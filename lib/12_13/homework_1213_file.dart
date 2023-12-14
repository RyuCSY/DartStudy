import 'dart:io';

main() async {
  File sourceFile = File('sample.csv');
  if(!sourceFile.existsSync()){
    sourceFile.writeAsString('1, 홍길동, 30\n2, 한석봉, 20');
  }

  final readData = await sourceFile.readAsLines();
  final target = '한석봉';
  final replace = '김석봉';

  print(readData);

  for (int j = 0; j < readData.length; j++) {
    var strList = readData[j].split(', ');

    for (int i = 0; i < strList.length; i++) {
      var str = strList[i].trim();
      if (str == target) {
        strList[i] = replace;
      }
    }

    readData[j] = strList.join(', ');
  }

  print(readData);

  File destFile = File('sample_copy.csv');
  destFile.writeAsString(readData.join('\n'));

}
