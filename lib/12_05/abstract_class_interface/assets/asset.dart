/// 자산(Asset) 클래스.
///
/// 모든 자산(Asset) 에는 이름이 있다.
abstract class Asset {
  String _name;

  Asset({
    required String name,
  }) : _name = name;

  String get name => _name;
}
