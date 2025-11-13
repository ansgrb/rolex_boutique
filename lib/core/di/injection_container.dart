import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rolex_boutique/app/presentation/manager/loading_provider.dart';
import 'package:rolex_boutique/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rolex_boutique/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rolex_boutique/features/auth/domain/repositories/auth_repository.dart';
import 'package:rolex_boutique/features/auth/domain/usecases/get_auth_state_changes.dart';
import 'package:rolex_boutique/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:rolex_boutique/features/auth/domain/usecases/sign_out.dart';
import 'package:rolex_boutique/features/auth/presentation/manager/auth_provider.dart';
import 'package:rolex_boutique/features/cart/presentation/manager/cart_provider.dart';
import 'package:rolex_boutique/features/shop/data/datasources/watch_remote_datasource.dart';
import 'package:rolex_boutique/features/shop/data/repositories/shop_repository_impl.dart';
import 'package:rolex_boutique/features/shop/domain/repositories/shop_repository.dart';
import 'package:rolex_boutique/features/shop/domain/usecases/get_shop_items.dart';
import 'package:rolex_boutique/features/shop/presentation/manager/shop_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // App
  sl.registerLazySingleton(() => LoadingProvider());

  // Features
  // Shop
  sl.registerFactory(() => ShopProvider(getShopItems: sl()));
  sl.registerLazySingleton(() => GetShopItems(sl()));
  sl.registerLazySingleton<ShopRepository>(() => ShopRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<WatchRemoteDataSource>(() => WatchRemoteDataSourceImpl());

  // Auth
  sl.registerFactory(() => AuthProvider(
        signInWithGoogle: sl(),
        signOut: sl(),
        getAuthStateChanges: sl(),
      ));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetAuthStateChanges(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(auth: sl(), googleSignIn: sl()));

  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn(
    clientId:
        '332603594391-3vqghng7hcn9980v1c7tp3kmd4932fci.apps.googleusercontent.com',
  ));

  // Cart
  sl.registerLazySingleton(() => CartProvider());
}
