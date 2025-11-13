import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:rolex_boutique/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rolex_boutique/features/auth/domain/entities/user_entity.dart';
import 'package:rolex_boutique/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rolex_boutique/features/auth/domain/repositories/auth_repository.dart';
import 'package:rolex_boutique/core/error/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity?>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.signInWithGoogle();
      return Right(user != null ? _mapFirebaseUserToUserEntity(user) : null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    return remoteDataSource.authStateChanges().map((firebaseUser) =>
        firebaseUser != null ? _mapFirebaseUserToUserEntity(firebaseUser) : null);
  }

  @override
  UserEntity? get currentUser {
    final user = remoteDataSource.currentUser;
    return user != null ? _mapFirebaseUserToUserEntity(user) : null;
  }

  UserEntity _mapFirebaseUserToUserEntity(firebase_auth.User firebaseUser) {
    return UserEntity(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
    );
  }
}
