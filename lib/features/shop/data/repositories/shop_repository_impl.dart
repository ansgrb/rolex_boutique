import 'package:rolex_boutique/features/shop/data/datasources/watch_remote_datasource.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';
import 'package:rolex_boutique/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/features/shop/domain/repositories/shop_repository.dart';
import 'package:rolex_boutique/core/error/exceptions.dart';

class ShopRepositoryImpl implements ShopRepository {
  final WatchRemoteDataSource remoteDataSource;

  ShopRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Item>>> getShopItems() async {
    try {
      final remoteItems = await remoteDataSource.getWatches();
      return Right(remoteItems);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
