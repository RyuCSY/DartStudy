import 'dart:convert';

main() async {
  print('데이터 가져오는 중...');
  var res = await getMovieInfo();
  print(jsonDecode(res)['director']);
}

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };

  return jsonEncode(mockData);
}
