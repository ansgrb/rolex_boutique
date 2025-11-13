import 'package:flutter/material.dart';
import 'package:rolex_boutique/features/shop/domain/usecases/get_shop_items.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';
import 'package:rolex_boutique/core/usecases/usecase.dart';

class ShopProvider extends ChangeNotifier {
  final GetShopItems getShopItems;

  ShopProvider({required this.getShopItems});

  List<Item> _items = [];
  List<Item> get items => _items;

  Future<void> loadItems() async {
    final failureOrItems = await getShopItems(NoParams());
    failureOrItems.fold(
      (failure) {
        // TODO: Handle failure
      },
      (items) {
        _items = items;
        notifyListeners();
      },
    );
  }
}
