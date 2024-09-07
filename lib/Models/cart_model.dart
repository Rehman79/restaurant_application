import 'package:flutter/material.dart';
import 'package:restaurant_app/Models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CartItem &&
              runtimeType == other.runtimeType &&
              product == other.product;

  @override
  int get hashCode => product.hashCode;
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addProduct(Product product, int quantity) {
    final existingItem = _items.firstWhere(
          (item) => item.product == product,
      orElse: () => CartItem(product: product),
    );

    if (_items.contains(existingItem)) {
      existingItem.quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  List<Product> getProductsByCategory(String category) {
    return _items
        .where((item) => item.product.category == category)
        .map((item) => item.product)
        .toList();
  }

  int get totalQuantity => _items.fold(0, (total, item) => total + item.quantity);

  double get totalPrice => _items.fold(0.0, (total, item) => total + item.product.price * item.quantity);
}
