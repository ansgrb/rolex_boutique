import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rolex_boutique/components/bottom_nav_bar.dart';
import 'package:rolex_boutique/components/search_delegate.dart';
import 'package:rolex_boutique/data/watch_data.dart';
import 'package:rolex_boutique/pages/cart_page.dart';
import 'package:flutter/services.dart';
import 'package:rolex_boutique/pages/shop_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // selected index to control the navigation flow

  int _selectedIndex = 0;

  void bottomBarNavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages

  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android
        statusBarBrightness: Brightness.light, // For iOS
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.grey[800]),
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

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Divider(color: Colors.grey[800]),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text("Logout", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => bottomBarNavigator(index),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
