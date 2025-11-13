import 'package:rolex_boutique/features/shop/domain/entities/item.dart';
import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/core/error/failures.dart';

abstract class ShopRepository {
  Future<Either<Failure, List<Item>>> getShopItems();
}
