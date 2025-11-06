import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          tabs: const [
            GButton(icon: Icons.home, text: "Shop"),
            GButton(icon: Icons.shopping_bag, text: "Cart"),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          color: Colors.grey[400],
          tabBorderRadius: 25,
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          onTabChange: (value) => onTabChange!(value),
        ),
      ),
    );
  }
}
