import 'dart:io';

main() {
  copy('Z:\111.jpg', 'Z:\222.jpg');
}

copy(String source, String dest) {
  File s = File(source);
  File d = File(dest);

  if (d.existsSync()) {
    print('"$dest" 파일이 이미 존재 합니다. 기존 파일을 삭제 후 진행해 주세요.');
  } else if (s.existsSync()) {
    d.writeAsBytesSync(s.readAsBytesSync());
  } else {
    print('"$source" 파일이 없습니다.');
  }

  // 사실상 아래 한줄로 해결 가능.
  // File(source).copy(dest);
}
