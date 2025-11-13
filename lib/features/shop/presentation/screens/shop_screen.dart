import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/features/shop/presentation/manager/shop_provider.dart';
import 'package:rolex_boutique/features/shop/presentation/widgets/item_tile_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ShopProvider>(context, listen: false).loadItems();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, shopProvider, child) {
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
                itemCount: shopProvider.items.length,
                itemBuilder: (context, index) {
                  double scale = max(0.8, 1 - (_currentPage - index).abs() * 0.2);
                  double opacity = max(0.7, 1 - (_currentPage - index).abs() * 0.3);

                  return Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity,
                      child: ItemTileWidget(item: shopProvider.items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
