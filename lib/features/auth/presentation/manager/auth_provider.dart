import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rolex_boutique/core/usecases/usecase.dart';
import 'package:rolex_boutique/features/auth/domain/entities/user_entity.dart';
import 'package:rolex_boutique/features/auth/domain/usecases/get_auth_state_changes.dart';
import 'package:rolex_boutique/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:rolex_boutique/features/auth/domain/usecases/sign_out.dart';

class AuthProvider extends ChangeNotifier {
  final SignInWithGoogle signInWithGoogle;
  final SignOut signOut;
  final GetAuthStateChanges getAuthStateChanges;

  UserEntity? _user;
  UserEntity? get user => _user;

  StreamSubscription? _userSubscription;

  AuthProvider({
    required this.signInWithGoogle,
    required this.signOut,
    required this.getAuthStateChanges,
  }) {
    final userStream = getAuthStateChanges(NoParams());
    userStream.fold(
      (failure) {
        // TODO: Handle failure
      },
      (stream) => _userSubscription = stream.listen((user) {
        _user = user;
        notifyListeners();
      }),
    );
  }

  Future<void> signIn() async {
    final failureOrUser = await signInWithGoogle(NoParams());
    failureOrUser.fold(
      (failure) {
        // TODO: Handle failure
      },
      (user) {
        _user = user;
        notifyListeners();
      },
    );
  }

  Future<void> logOut() async {
    await signOut(NoParams());
    _user = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}
