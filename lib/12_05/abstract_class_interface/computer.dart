import 'assets/tangible_asset.dart';

class Computer extends TangibleAsset {
  String maker;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required this.maker,
  });
}
