import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/models/cart.dart';
import 'package:rolex_boutique/models/loading_provider.dart';
import 'package:rolex_boutique/pages/get_started.dart';
import 'package:rolex_boutique/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => LoadingProvider()),
      ],
      child: MyApp(seen: seen),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool seen;
  const MyApp({super.key, required this.seen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rolex Boutique",
      home: seen ? const MainPage() : const GetStartedPage(),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Consumer<LoadingProvider>(
              builder: (context, loadingProvider, _) {
                if (loadingProvider.isLoading) {
                  return Container(
                    color: Colors.black.withOpacity(0.7),
                    child: Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: const Color(0xFFcaa94a),
                        size: 50,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }
}
