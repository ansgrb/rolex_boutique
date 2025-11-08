import 'package:flutter/material.dart';
import 'package:rolex_boutique/models/item.dart';
import 'package:rolex_boutique/pages/item_details_page.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => ItemDetailsPage(item: item),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Watch Image (Bigger)
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Hero(
              tag: 'watch_${item.name}',
              child: Image.asset(item.imagePath, fit: BoxFit.contain),
            ),
          ),

          // Item Name Only
          Positioned(
            top: 50,
            child: Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF4A4A4A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
