import 'dart:convert';
import 'dart:math';

import 'package:dart_exam/12_14/homework/models/movie_data.dart';
import 'package:dart_exam/12_14/homework/models/movie_detail.dart';
import 'package:http/http.dart' as http;

const url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';

main() async {
  MovieData movieData = await getMovieData();
  print('\n연습문제 1 영화정보를 가져와서 모델에 담고 json 형태로 출력하기');
  print(movieData.itemList);

  print('\n연습문제 2 영화의 상세정보를 모델에 담고 json 형태로 출력하기');
  MovieDetail movieInfo = await getMovieInfo(movieData);
  print(movieInfo);
}

Future<MovieData> getMovieData() async {
  var res = await http.get(Uri.parse(url));
  return MovieData.fromJson(jsonDecode(res.body));
}

Future<MovieDetail> getMovieInfo(MovieData movieData) async {
  MovieItem? item = movieData.itemList?[Random().nextInt(movieData.itemList?.length ?? 0)] ?? null;
  int movieId = item?.id ?? 1113278;

  var res = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${movieId}?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));
  return MovieDetail.fromJson(jsonDecode(res.body));
}