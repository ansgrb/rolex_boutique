import 'package:rolex_boutique/features/shop/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.name,
    required super.price,
    required super.imagePath,
    required super.description,
    super.quantity = 1,
  });

  // In a real app, you would have fromJson and toJson methods.
  // factory ItemModel.fromJson(Map<String, dynamic> json) { ... }
  // Map<String, dynamic> toJson() { ... }
}
