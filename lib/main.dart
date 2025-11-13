import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/app/app.dart';
import 'package:rolex_boutique/features/cart/presentation/manager/cart_provider.dart';
import 'package:rolex_boutique/app/presentation/manager/loading_provider.dart';
import 'package:rolex_boutique/features/auth/presentation/manager/auth_provider.dart';
import 'package:rolex_boutique/features/shop/presentation/manager/shop_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rolex_boutique/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<LoadingProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ShopProvider>()),
      ],
      child: MyApp(seen: seen),
    ),
  );
}