class Item {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  int quantity;

  Item({
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
}
