class MaskInfo {
  int? _count;
  List<Store>? _stores;

  int get count => _count ?? 0;

  List<Store> get stores => _stores ?? [];

  MaskInfo({
    int? count,
    List<Store>? stores,
  }) {
    _count = count;
    _stores = stores;
  }

  MaskInfo.fromJson(dynamic json) {
    _count = json['count'];
    if (json['stores'] != null) {
      _stores = [];
      json['stores'].forEach((v) {
        _stores?.add(Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_stores != null) {
      map['stores'] = _stores?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Store {
  String? _addr;
  String? _code;
  String? _createdAt;
  double? _lat;
  double? _lng;
  String? _name;
  String? _remainStat;
  String? _stockAt;
  String? _type;

  String get addr => _addr ?? '';

  String get code => _code ?? '';

  String get createdAt => _createdAt ?? '';

  double get lat => _lat ?? 0;

  double get lng => _lng ?? 0;

  String get name => _name ?? '';

  String get remainStat => _remainStat ?? '';

  String get stockAt => _stockAt ?? '';

  String get type => _type ?? '';

  bool get hasNull =>
      [_addr, _code, _createdAt, _lat, _lng, _name, _remainStat, _stockAt, _type].contains(null);

  Store({
    String? addr,
    String? code,
    String? createdAt,
    double? lat,
    double? lng,
    String? name,
    String? remainStat,
    String? stockAt,
    String? type,
  }) {
    _addr = addr;
    _code = code;
    _createdAt = createdAt;
    _lat = lat;
    _lng = lng;
    _name = name;
    _remainStat = remainStat;
    _stockAt = stockAt;
    _type = type;
  }

  Store.fromJson(dynamic json) {
    _addr = json['addr'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _lat = json['lat'];
    _lng = json['lng'];
    _name = json['name'];
    _remainStat = json['remain_stat'];
    _stockAt = json['stock_at'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addr'] = _addr;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['name'] = _name;
    map['remain_stat'] = _remainStat;
    map['stock_at'] = _stockAt;
    map['type'] = _type;
    return map;
  }

  @override
  String toString() {
    return 'Store{addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type}';
  }
}
