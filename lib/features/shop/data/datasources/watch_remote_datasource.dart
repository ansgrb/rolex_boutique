import 'package:rolex_boutique/features/shop/domain/entities/item.dart';

abstract class WatchRemoteDataSource {
  Future<List<Item>> getWatches();
}

class WatchRemoteDataSourceImpl implements WatchRemoteDataSource {
  final List<Item> _watchShop = [
    Item(
      name: "Cosmograph Daytona",
      price: "2,400,000",
      imagePath: "assets/images/watches/dyt.png",
      description: "The chronograph that made a watch an icon.",
      quantity: 1,
    ),
    Item(
      name: "Submariner Date",
      price: "1,600,000",
      imagePath: "assets/images/watches/smd.png",
      description: "The reference among divers' watches.",
      quantity: 1,
    ),
    Item(
      name: "GMT-Master II",
      price: "1,800,000",
      imagePath: "assets/images/watches/sd.png",
      description: "The cosmopolitan watch.",
      quantity: 1,
    ),
    Item(
      name: "Day-Date 40",
      price: "4,500,000",
      imagePath: "assets/images/watches/dd.png",
      description: "The ultimate watch of prestige.",
      quantity: 1,
    ),
    Item(
      name: "Air-King",
      price: "800,000",
      imagePath: "assets/images/watches/ak.png",
      description: "A homage to aviation.",
      quantity: 1,
    ),
    Item(
      name: "Explorer",
      price: "950,000",
      imagePath: "assets/images/watches/ex.png",
      description: "The call of the peaks.",
      quantity: 1,
    ),
  ];

  @override
  Future<List<Item>> getWatches() async {
    // In a real app, you would fetch this from a remote server.
    return Future.value(_watchShop);
  }
}
