
import 'package:flutter/material.dart';
import 'package:flutter_traditional_snack/models/Product.dart';
import 'package:flutter_traditional_snack/models/ProductItem.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    for (ProductItem item in cart) {
      if (item.product.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(ProductItem(product: product));
    notifyListeners();
  }

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
