void main() {
  String s1 = '123';
  String s2 = '123';

  print(identical(s1, s2));
  
  String greeting = 'Hello'; // new
  String greeting2 = 'Hello'; // new

  print(identical(greeting, greeting2)); // true

  print(greeting.replaceAll('H', 'J'));
  print(greeting); // ???

  Person person = const Person('홍길동'); // new
  Person person2 = const Person('홍길동'); // 재사용

  print(person == person2);
  print(identical(person, person2));
}

class Person {
  final String name;

  const Person(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}