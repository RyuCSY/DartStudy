import 'asset.dart';

/// 무형자산(IntangibleAsset) 클래스.
///
/// 모든 무형자산 에는 이름, 가격이 있다.
abstract class IntangibleAsset extends Asset {
  int price;

  IntangibleAsset({
    required String name,
    required this.price,
  }) : super(name);
}
