import 'dart:io';
/**
 * 매운맛 - 자판기.
 */

class Product {
  String name;
  int price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  @override
  String toString() {
    //초콜릿 - 가격: 500원, 수량: 5개
    return '$name - 가격: ${price}원, 수량: ${quantity} 개';
  }
}

class VendingMachine {
  int balance = 0;
  List<Product> productList;

  VendingMachine(this.productList);

  void printMenu() {
    for (int i = 0; i < productList.length; i++) {
      print('$i\t${productList[i]}');
    }
  }

  void buy(int index) {
    //[빼빼로 구매 성공] 가격: 600원, 거스름돈: 4400원, 남은 수량: 4개
    var product = productList[index];

    if (product.price <= balance && product.quantity != 0) {
      balance -= product.price;
      product.quantity--;

      print(
          '[${product.name} 구매 성공] 가격: ${product.price}원, 거스름돈: $balance원, 남은 수량: ${product.quantity}개');
    } else if (product.quantity == 0) {
      print(
          '[${product.name} 구매 실패] 수량이 부족합니다. 가격: ${product.price}원, 잔액: $balance원, 남은 수량: ${product.quantity}개');
    } else {
      print(
          '[${product.name} 구매 실패] 금액이 부족합니다. 가격: ${product.price}원, 잔액: $balance원, 남은 수량: ${product.quantity}개');
    }
  }

  @override
  String toString() {
    String ret = '===== 자판기 상태 =====';
    for (Product p in productList) {
      ret += '\n${p}';
    }
    ret += '\n======================';

    return ret;
  }
}

main() {
  bool useManual = true;

  var machine = VendingMachine([
    Product('초콜릿', 500, 5),
    Product('빼빼로', 600, 5),
    Product('환타', 1000, 5),
    Product('사이다', 1100, 5)
  ]);

  machine.balance = 5000;

  if (!useManual) {
    print(machine);
    machine.buy(1);
    print(machine);
  } else {
    int exitCode = 999;
    int index;

    do {
      machine.printMenu();
      print('원하는 상품의 번호를 입력 하세요. 잔액${machine.balance}, 종료 $exitCode 입력.');
      try {
        index = int.parse(stdin.readLineSync()!);
      } catch (e) {
        index = 0;
        print('잘못 입력하셨습니다..');
        continue;
      }

      if (index == exitCode) {
        break;
      }
      if (index >= machine.productList.length) {
        print('잘못 입력하셨습니다..');
      } else {
        machine.buy(index);
      }
    } while (index != exitCode);

    print('이용해 주셔서 감사합니다.');
  }
}
