import 'assets/tangible_asset.dart';

class Book extends TangibleAsset {
  String _isbn;

  String get isbn => _isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required String isbn,
  }) : _isbn = isbn;
}
