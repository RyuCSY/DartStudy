import 'assets/intangible_asset.dart';

class Patent extends IntangibleAsset {
  String _patentNumber;

  Patent({
    required String name,
    required String patentNumber,
    required int price,
  })  : _patentNumber = patentNumber,
        super(name: name, price: price);
}
