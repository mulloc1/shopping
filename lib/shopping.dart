import 'dart:io';

import 'package:shopping/shopping_mall/shopping_mall.dart';

void optionsDisplay() {
  print("--------------------------------------------------------------------------");
  print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화");
  print("--------------------------------------------------------------------------");
}

void main() {
  ShoppingMall shoppingMall = ShoppingMall();

  while (true) {
    optionsDisplay();
    String? input = stdin.readLineSync()?.trim();
    int? choice;
    try {
      choice = int.parse(input!);
    } catch (e) {
      print("잘못된 입력입니다. 숫자를 입력해주세요.");
      continue;
    }

    try {
      switch (choice) {
        case 1:
          shoppingMall.showProducts();
          break;
        case 2:
          shoppingMall.addToCart();
          break;
        case 3:
          shoppingMall.showCart();
          break;
        case 4:
          print("정말 종료하시겠습니까? 종료를 원하면 5를 입력하시오.");
          if (stdin.readLineSync()?.trim() != "5")
            break;
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
          return;
        case 6:
          shoppingMall.clearCart();
        default:
          print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
      }
    } catch (e) {
      print(e.toString());
    }

  }
}
