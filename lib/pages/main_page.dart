import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rolex_boutique/components/bottom_nav_bar.dart';
import 'package:rolex_boutique/components/search_delegate.dart';
import 'package:rolex_boutique/data/watch_data.dart';
import 'package:rolex_boutique/pages/about_page.dart';
import 'package:rolex_boutique/pages/cart_page.dart';
import 'package:flutter/services.dart';
import 'package:rolex_boutique/components/auth_drawer_section.dart';
import 'package:rolex_boutique/pages/shop_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
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
                delegate: WatchSearchDelegate(watchShop),
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
                      'lib/images/emblems/rolex_crown.svg',
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
                          builder: (context) => const AboutPage(),
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
      ),
      body: _pages[_selectedIndex],
    );
  }
}
