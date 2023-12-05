import 'assets/tangible_asset.dart';

class Computer extends TangibleAsset {
  String maker;

  Computer({
    required String name,
    required int price,
    required String color,
    required this.maker,
  }) : super(name: name, price: price, color: color);
}
