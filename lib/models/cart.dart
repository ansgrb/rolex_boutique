import 'package:flutter/material.dart';
import 'package:rolex_boutique/data/watch_data.dart';
import 'package:rolex_boutique/models/item.dart';

class Cart extends ChangeNotifier {
  // list of items for sale
  List<Item> get listOfItems => watchShop;

  // list of items in user's cart
  List<Item> userCart = [];

  // get list of items for sale
  List<Item> getItemsList() {
    return listOfItems;
  }

  // get the cart
  List<Item> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Item item) {
    if (isItemInCart(item)) return;
    item.quantity = 1;
    userCart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Item item) {
    userCart.remove(item);
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  // is item in cart
  bool isItemInCart(Item item) {
    return userCart.contains(item);
  }

  // increment item quantity
  void incrementItemQuantity(Item item) {
    final index = userCart.indexOf(item);
    if (index != -1) {
      userCart[index].quantity++;
      notifyListeners();
    }
  }

  // decrement item quantity
  void decrementItemQuantity(Item item) {
    final index = userCart.indexOf(item);
    if (index != -1 && userCart[index].quantity > 1) {
      userCart[index].quantity--;
      notifyListeners();
    }
  }

  // get total number of items in cart
  int get totalItemsInCart {
    int total = 0;
    for (var item in userCart) {
      total += item.quantity;
    }
    return total;
  }
}
