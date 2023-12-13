import 'dart:math';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

main() {
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  print('1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오.');

  var findList = transactions
      .where((transaction) => transaction.year == 2011)
      .toList()
    ..sort((t1, t2) => t1.value.compareTo(t2.value));

  findList.forEach((transaction) {
    print(transaction.trader.name);
  });

// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print('\n2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오');
  Set<String> citySet = {};
  transactions.forEach((transactions) {
    citySet.add(transactions.trader.city);
  });

  citySet.forEach((city) {
  print(city);
  });


// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  print('\n3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오');
  findList = transactions
      .where((transaction) => transaction.trader.city == 'Cambridge')
      .toList()
    ..sort((t1, t2) => t1.trader.name.compareTo(t2.trader.name));

  Set<String> nameSet = {};

  findList.forEach((transaction) {
    nameSet.add(transaction.trader.name);
  });

  nameSet.forEach((name) {
    print(name);
  });

// 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  print('\n4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오');
  transactions.sort((t1, t2) => t1.trader.name.compareTo(t2.trader.name));
  transactions.forEach((transaction) {
    print(transaction.trader.name);
  });

// 5. 밀라노에 거래자가 있는가?
  bool hasMilan = transactions.where((transaction) => transaction.trader.city == 'Milan').isNotEmpty;
  print('\n5. 밀라노에 거래자가 있는가? = $hasMilan');

// 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  print('\n6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오');
  transactions
      .where((transaction) => transaction.trader.city == 'Cambridge')
      .forEach((transaction) {
    print(transaction);
  });

// 7. 전체 트랜잭션 중 최대값은 얼마인가?
  Transaction maxTransaction=  transactions.reduce((t1, t2) => (t1.value == max(t1.value, t2.value)) ? t1 : t2);
  print('\n7. 전체 트랜잭션 중 최대값은 얼마인가?');
  print(maxTransaction.value);


// 8. 전체 트랜잭션 중 최소값은 얼마인가?
  Transaction minTransaction=  transactions.reduce((t1, t2) => (t1.value == min(t1.value, t2.value)) ? t1 : t2);
  print('\n8. 전체 트랜잭션 중 최소값은 얼마인가?');
  print(minTransaction.value);
}
