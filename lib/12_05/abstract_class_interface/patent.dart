import 'assets/intangible_asset.dart';

class Patent extends IntangibleAsset {
  String _patentNumber;

  Patent({
    required super.name,
    required super.price,
    required String patentNumber,
  }) : _patentNumber = patentNumber;
}
