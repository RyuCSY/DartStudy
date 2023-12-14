import 'dart:io';
import 'dart:math';
import 'package:dart_exam/12_14/homework/utils/file_downloader.dart' as fileDownloader;

import '../models/movie_data.dart';

const base_img_url = 'https://image.tmdb.org/t/p/w220_and_h330_face';
//const base_img_url = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2';

class ImageRandomDownloader {
  _RandomUrlGenerator generator;

  ImageRandomDownloader(MovieData movieData) : this.generator = _RandomUrlGenerator(movieData);

  Future<File> download() async {
    _UrlItem item = generator.nextItem();
    return await fileDownloader.downloadFile(item.url, fileName: item.fName);
  }
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
