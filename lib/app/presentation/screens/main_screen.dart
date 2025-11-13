import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/app/presentation/widgets/bottom_nav_bar.dart';
import 'package:rolex_boutique/features/shop/presentation/widgets/shop_search_delegate.dart';
import 'package:rolex_boutique/features/about/presentation/screens/about_screen.dart';
import 'package:rolex_boutique/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/services.dart';
import 'package:rolex_boutique/features/auth/presentation/widgets/auth_drawer_section.dart';
import 'package:rolex_boutique/features/shop/presentation/screens/shop_screen.dart';
import 'package:rolex_boutique/features/shop/presentation/manager/shop_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // selected index to control the navigation flow
  int _selectedIndex = 0;

  // track drawer state
  bool _isDrawerOpen = false;

  void bottomBarNavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages
  final List<Widget> _pages = [const ShopScreen(), const CartScreen()];

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    return Scaffold(
      // backgroundColor: Color(0xFFEEE9E3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: _isDrawerOpen
            ? SystemUiOverlayStyle.light
                .copyWith(statusBarColor: Colors.transparent)
            : const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark, // For Android
                statusBarBrightness: Brightness.light, // For iOS
              ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu,
                color: _isDrawerOpen ? Colors.white : Colors.grey[800]),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[800]),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ShopSearchDelegate(shopProvider.items),
              );
            },
          ),
        ],
      ),
      onDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
      },
      drawer: Drawer(
        backgroundColor: const Color(0xFF0b4f3a),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // emblem
                DrawerHeader(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SvgPicture.asset(
                      'assets/images/emblems/rolex_crown.svg',
                      height: 240.0,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      bottomBarNavigator(0);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                    title: const Text(
                      "Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      bottomBarNavigator(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.info, color: Colors.white),
                    title: const Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const AuthDrawerSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => bottomBarNavigator(index),
        selectedIndex: _selectedIndex,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
