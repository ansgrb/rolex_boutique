import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  final int quantity;

  const Item({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    this.quantity = 1,
  });

  Item copyWith({int? quantity}) {
    return Item(
      name: name,
      price: price,
      imagePath: imagePath,
      description: description,
      quantity: quantity ?? this.quantity,
    );
  }
  
  @override
  List<Object?> get props => [name, price, imagePath, description, quantity];
}
