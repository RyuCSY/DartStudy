class NameOwner {
  // 캡슐화 파트 연습에 맞게, 외부 수정을 막음.
  String _name;

  String get name => _name;
  NameOwner(this._name) {
    //조건 1. 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
    if (_name.trim().length < 3) {
      throw Exception('${this.runtimeType.toString()} 이름은 반드시 3글자 이상 이어야 합니다.');
    }
  }

  // 개발 단계는 assert 를 활용한 아래 방법도 가능.
  // NameOwner(this._name) : assert(_name.trim().length < 3, '이름은 반드시 3문자 이상 이어야 합니다.');

  @override
  String toString() {
    return '${this.runtimeType.toString()}{name: $_name,';
  }
}
