import 'package:flutter/material.dart';
import 'package:instadrunkapp/dto/product.dart' as dto;

class CartContent {
  dto.Product product;
  int amount;

  CartContent(this.product) : amount = 1;
}

class Cart extends ChangeNotifier {
  List<CartContent> items = [];

  CartContent _getProductFromCollection(String id) {
    return items.firstWhere((item) => item.product.id == id,
        orElse: () => null);
  }

  void add(dto.Product product) {
    final productInCart = _getProductFromCollection(product.id);

    if (productInCart != null) {
      productInCart.amount++;
    } else {
      items.add(CartContent(product));
    }

    notifyListeners();
  }

  void remove(dto.Product product) {
    final productInCart = _getProductFromCollection(product.id);

    if (productInCart.amount > 1) {
      productInCart.amount--;
    } else {
      items.removeWhere((item) => item.product.id == product.id);
    }

    notifyListeners();
  }

  void clear() {
    items = [];
    notifyListeners();
  }
}
