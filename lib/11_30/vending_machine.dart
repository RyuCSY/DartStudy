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

      print('[${product.name} 구매 성공] 가격: ${product.price}원, 거스름돈: $balance원, 남은 수량: ${product.quantity}개');
    } else if (product.quantity == 0) {
      print('[${product.name} 구매 실패] 수량이 부족합니다. 가격: ${product.price}원, 잔액: $balance원, 남은 수량: ${product.quantity}개');
    } else {
      print('[${product.name} 구매 실패] 금액이 부족합니다. 가격: ${product.price}원, 잔액: $balance원, 남은 수량: ${product.quantity}개');
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
  var machine = VendingMachine([
    Product('초콜릿', 500, 5),
    Product('빼빼로', 600, 5),
    Product('환타', 1000, 5),
    Product('사이다', 1100, 5)
  ]);

  machine.balance = 5000;

  print(machine);
  machine.buy(1);
  print(machine);
}
