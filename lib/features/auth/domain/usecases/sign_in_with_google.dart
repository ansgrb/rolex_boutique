import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/core/error/failures.dart';
import 'package:rolex_boutique/core/usecases/usecase.dart';
import 'package:rolex_boutique/features/auth/domain/entities/user_entity.dart';
import 'package:rolex_boutique/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle implements UseCase<UserEntity?, NoParams> {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}
