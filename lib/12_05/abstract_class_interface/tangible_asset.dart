abstract class TangibleAsset {
  String _name;
  int _price;
  String _color;

  TangibleAsset({
    required String name,
    required int price,
    required String color,
  })  : _color = color,
        _price = price,
        _name = name;

  String get name => _name;

  int get price => _price;

  String get color => _color;
}
