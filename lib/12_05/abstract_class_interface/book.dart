import 'computer.dart';
import 'tangible_asset.dart';

class Book extends TangibleAsset {
  String _isbn;

  String get isbn => _isbn;

  Book({
    required String name,
    required int price,
    required String color,
    required String isbn,
  })  : _isbn = isbn,
        super(name: name, price: price, color: color);
}