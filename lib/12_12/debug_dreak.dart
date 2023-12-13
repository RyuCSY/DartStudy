import '../12_05/inheritance/hero_example.dart';

void main(List<String> arguments) {
  final heroes = <Hero>{};

  final h1 = Hero('슈퍼맨', 100);
  final h2 = Hero('슈퍼맨', 100);

  heroes.add(h1);
  heroes.add(h2);

  print(heroes.length);

  heroes.remove(h2);

  print(heroes.length);
}
