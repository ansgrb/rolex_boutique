import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/core/error/failures.dart';
import 'package:rolex_boutique/core/usecases/usecase.dart';
import 'package:rolex_boutique/features/auth/domain/entities/user_entity.dart';
import 'package:rolex_boutique/features/auth/domain/repositories/auth_repository.dart';

class GetAuthStateChanges implements StreamUseCase<UserEntity?, NoParams> {
  final AuthRepository repository;

  GetAuthStateChanges(this.repository);

  @override
  Either<Failure, Stream<UserEntity?>> call(NoParams params) {
    return Right(repository.authStateChanges());
  }
}
