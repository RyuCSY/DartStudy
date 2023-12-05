import 'asset.dart';

/// 유형자산(TangibleAsset)   클래스.
///
/// 모든 유형자산 에는 이름, 가격, 색상이 있다.
abstract class TangibleAsset extends Asset {
  int price;
  String _color;

  TangibleAsset({
    required String name,
    required this.price,
    required String color,
  })  : _color = color,
        super(name);

  String get color => _color;
}
