import 'dart:convert';
import 'dart:io';

const String fileName = 'company.txt';

const String fieldLeader = 'leader';
const String fieldName = 'name';
const String fieldAge = 'age';

class Employee {
  String name;
  int age;

  Employee({
    required this.name,
    required this.age,
  });

  Map<String, dynamic> _toMap() {
    return {
      fieldName: this.name,
      fieldAge: this.age,
    };
  }

  factory Employee._map2Employee(Map<String, dynamic> map) {
    if (!map.containsKey(fieldName) || !map.containsKey(fieldAge)) {
      throw Exception();
    }

    return Employee(
      name: map[fieldName] as String,
      age: map[fieldAge] as int,
    );
  }

  String toJsonString() {
    return jsonEncode(_toMap());
  }

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
}

class Department {
  String name;
  Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

  Map<String, dynamic> _toMap() {
    return {
      fieldName: this.name,
      fieldLeader: this.leader.toJsonString(),
    };
  }

  factory Department._map2Department(Map<String, dynamic> map) {
    var readData = jsonDecode(map[fieldLeader]);

    if (readData is Map<String, dynamic>) {
      return Department(
        name: map[fieldName] as String,
        leader: Employee._map2Employee(readData),
      );
    } else {
      throw Exception('잘못된 데이터가 입력됐습니다. : $json');
    }
  }

  File saveFile() {
    File f = File(fileName);
    f.writeAsStringSync(toJsonString());
    return f;
  }

  factory Department.fromJson(String json) {
    try {
      var map = jsonDecode(json);

      if (!map.containsKey(fieldName) || !map.containsKey(fieldLeader))
        throw Exception();

      return Department._map2Department(map);
    } on Exception {
      throw Exception('잘못된 데이터가 입력됐습니다. : $json');
    }
  }

  String toJsonString() {
    return jsonEncode(_toMap());
  }

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }
}

///총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 쓰는 프로그램을 작성하시오.
// 직렬화를 위해 위의 2개 클래스를 일부 수정해도 됩니다.
main() {
  Employee leader = Employee(name: '홍길동', age: 41);
  Department department = Department(name: '총무부', leader: leader);
  print('만들어진 객체 = ${department}');

  var saveFile = department.saveFile();
  var strReadData = saveFile.readAsStringSync();

  print('\n저장된 파일 내용 = ${strReadData}');

  Department readData = Department.fromJson(strReadData);
  print('\n읽어온 객체 = ${readData}');
}
