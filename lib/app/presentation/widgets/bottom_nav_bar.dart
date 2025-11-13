import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/features/cart/presentation/manager/cart_provider.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  final int selectedIndex;
  const BottomNavBar(
      {super.key, required this.onTabChange, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: GNav(
        selectedIndex: selectedIndex,
        tabs: [
          const GButton(icon: Icons.home_rounded, text: "Shop"),
          GButton(
            icon: Icons.shopping_bag,
            text: "Cart",
            leading: context.watch<CartProvider>().userCart.isEmpty
                ? null
                : Badge(
                    label: Text(
                      context.watch<CartProvider>().totalItemsInCart.toString(),
                    ),
                    child: const Icon(Icons.shopping_bag_rounded),
                  ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        color: Colors.grey[400],
        tabBorderRadius: 25,
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        onTabChange: (value) => onTabChange!(value),
      ),
    );
  }
}
