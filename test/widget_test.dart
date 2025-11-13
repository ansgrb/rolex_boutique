import 'package:flutter_test/flutter_test.dart';
import 'package:rolex_boutique/app/app.dart';
import 'package:rolex_boutique/app/presentation/screens/get_started_screen.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/app/presentation/manager/loading_provider.dart';
import 'package:rolex_boutique/features/auth/presentation/manager/auth_provider.dart';
import 'package:rolex_boutique/features/cart/presentation/manager/cart_provider.dart';
import 'package:rolex_boutique/features/shop/presentation/manager/shop_provider.dart';
import 'package:rolex_boutique/core/di/injection_container.dart' as di;

void main() {
  testWidgets('Renders GetStartedScreen when not seen',
      (WidgetTester tester) async {
    // Set up the dependency injection container.
    await di.init();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
          ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
          ChangeNotifierProvider(create: (context) => di.sl<LoadingProvider>()),
          ChangeNotifierProvider(create: (context) => di.sl<ShopProvider>()),
        ],
        child: const MyApp(seen: false),
      ),
    );

    // Verify that GetStartedScreen is shown.
    expect(find.byType(GetStartedScreen), findsOneWidget);
  });
}
