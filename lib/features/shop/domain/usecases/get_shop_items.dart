import 'package:rolex_boutique/features/shop/domain/entities/item.dart';
import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/core/error/failures.dart';
import 'package:rolex_boutique/features/shop/domain/repositories/shop_repository.dart';
import 'package:rolex_boutique/core/usecases/usecase.dart';

class GetShopItems implements UseCase<List<Item>, NoParams> {
  final ShopRepository repository;

  GetShopItems(this.repository);

  @override
  Future<Either<Failure, List<Item>>> call(NoParams params) async {
    return await repository.getShopItems();
  }
}
