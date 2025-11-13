import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/core/error/failures.dart';
import 'package:rolex_boutique/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity?>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Stream<UserEntity?> authStateChanges();
  UserEntity? get currentUser;
}
