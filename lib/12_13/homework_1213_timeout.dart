import 'dart:async';

main() async {
  String str = await timeoutFuture().timeout(Duration(seconds: 5), onTimeout: (){
    return 'timeout';
  });

  print('str = $str');
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}
