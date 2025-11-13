import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolex_boutique/features/cart/presentation/widgets/add_to_cart_button.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;
  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android
        statusBarBrightness: Brightness.light, // For iOS
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: BackButton(color: Colors.grey[800]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Image
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                child: Hero(
                  tag: 'watch_${item.name}',
                  child: Image.asset(item.imagePath),
                ),
              ),

              // Item Info
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // Name
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Description
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Price
                    Text(
                      "\$${item.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey[900],
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Add to cart button
                    AddToCartButton(item: item),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
