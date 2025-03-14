import 'dart:convert';
import 'dart:io';

import 'package:shopping/shopping_mall/product.dart';

class MyCustomException implements Exception {
  final String message;
  MyCustomException(this.message);

  @override
  String toString() => message;
}

class ShoppingMall {
  int totalPrice = 0;
  List<Product> items = [
    Product(name: '셔츠', price: 45000),
    Product(name: '원피스', price: 30000),
    Product(name: '반팔티', price: 35000),
    Product(name: '반바지', price: 38000),
    Product(name: '양말', price: 5000),
  ];
  Set<String> cart = {};

  // carts의 내용을 출력함
  void showProducts() {
    for (int i = 0; i < items.length; i++) {
      print('${items[i].name} : ${items[i].price}원');
    }
  }

  // Product 객체를 매개변수로 받아 carts에 추가
  void addToCart() {
    late String? name;
    late String? countString;
    late int? countInt;

    print('상품 이름 : ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!)?.trim();
    print(name);
    print('상품 갯수 : ');
    countString = stdin.readLineSync()?.trim();

    if (!isString(name) || !isString(countString)) {
      throw MyCustomException('입력값이 올바르지 않아요 !');
    }

    try {
      countInt = int.parse(countString!);
    } catch (e) {
      throw MyCustomException('입력값이 올바르지 않아요 !');
    }

    if (countInt <= 0) {
      throw MyCustomException('0개보다 많은 개수의 상품만 담을 수 있어요!');
    }

    if (!isExist(name!)) {
      throw MyCustomException('입력값이 올바르지 않아요 !');
    }

    Product selectedProduct = items.firstWhere((item) => item.name == name);
    cart.add(name);
    totalPrice += selectedProduct.price * countInt;
    print('장바구니에 상품이 담겼어요 !');
  }

  // totalPrice의 값을 출력함
  void showTotal() {
    print("장바구니에 $totalPrice원 어치를 담으셨네요 ! ");
  }

  void showCart() {
    if (cart.isEmpty) {
      throw MyCustomException('장바구니에 담긴 상품이 없습니다.');
    } else {
      if (cart.length == 1) {
        print('장바구니에 ${cart.join()}가 담겨있네요. 총 ${totalPrice}원 입니다!');
      } else {
        print('장바구니에 ${cart.join(', ')}가 담겨있네요. 총 ${totalPrice}원 입니다!');
      }
    }
  }

  void clearCart() {
    if (totalPrice <= 0) {
      throw MyCustomException('이미 장바구니가 비어있습니다.');
    }
    print('장바구니를 초기화합니다.');
    totalPrice = 0;
    cart.clear();
  }

  bool isString(String? input) {
    return input != null && input.isNotEmpty;
  }

  bool isExist(String name) {
    return items.any((item) => item.name == name);
  }
}
