import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rolex_boutique/components/item_tile.dart';
import 'package:rolex_boutique/data/watch_data.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75, initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        if (_pageController.page != null) {
          _currentPage = _pageController.page!;
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 25, bottom: 10),
          child: Text(
            'Our Collections',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xFF4A4A4A),
            ),
          ),
        ),

        // Immersive Carousel
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: watchShop.length,
            itemBuilder: (context, index) {
              double scale = max(0.8, 1 - (_currentPage - index).abs() * 0.2);
              double opacity = max(0.7, 1 - (_currentPage - index).abs() * 0.3);

              return Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: opacity,
                  child: ItemTile(item: watchShop[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
