import 'package:flutter/material.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';

class CartProvider extends ChangeNotifier {
  // list of items in user's cart
  final List<Item> _userCart = [];

  // get the cart
  List<Item> get userCart => _userCart;

  // add items to cart
  void addItemToCart(Item item) {
    if (isItemInCart(item)) return;
    final newItem = item.copyWith(quantity: 1);
    _userCart.add(newItem);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Item item) {
    _userCart.remove(item);
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }

  // is item in cart
  bool isItemInCart(Item item) {
    return _userCart.any((cartItem) => cartItem.name == item.name);
  }

  // increment item quantity
  void incrementItemQuantity(Item item) {
    final index = _userCart.indexWhere((cartItem) => cartItem.name == item.name);
    if (index != -1) {
      _userCart[index] = _userCart[index].copyWith(quantity: _userCart[index].quantity + 1);
      notifyListeners();
    }
  }

  // decrement item quantity
  void decrementItemQuantity(Item item) {
    final index = _userCart.indexWhere((cartItem) => cartItem.name == item.name);
    if (index != -1 && _userCart[index].quantity > 1) {
      _userCart[index] = _userCart[index].copyWith(quantity: _userCart[index].quantity - 1);
      notifyListeners();
    }
  }

  // get total number of items in cart
  int get totalItemsInCart {
    int total = 0;
    for (var item in _userCart) {
      total += item.quantity;
    }
    return total;
  }
}
