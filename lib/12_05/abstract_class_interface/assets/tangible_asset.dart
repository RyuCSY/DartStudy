import '../../thing.dart';
import 'asset.dart';

const double UNKNOWN_WEIGHT = -1;

/// 유형자산(TangibleAsset)   클래스.
///
/// 모든 유형자산 에는 이름, 가격, 색상이 있다.
abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String _color;
  double _weight = UNKNOWN_WEIGHT;

  TangibleAsset({
    required String name,
    required this.price,
    required String color,
  })  : _color = color,
        super(name);

  String get color => _color;

  /// 연습문제 12-4
  ///
  ///유형자산 (TangibleAsset) 은, 자산 (Asset) 의 일종이며, 형태가 있는 것 (Thing) 의 일종이기도 하다.
  // 이 정의에 맞도록 TangibleAsset 의 소스 코드를 수정하시오.
  // 이 때, TangibleAsset 에 필드나 메소드의 추가가 필요하다면, 적당히 추가하시오.
  ///
  @override
  Thing setWeight(double value) {
    if (value < 0) {
      throw Exception('무게는 0 이상만 가능 합니다.');
    }
    _weight = value;

    return this;
  }

  @override
  double getWeight() {
    if (_weight == UNKNOWN_WEIGHT) {
      throw Exception('무게를 알 수 없습니다.');
    }
    return _weight;
  }
}
