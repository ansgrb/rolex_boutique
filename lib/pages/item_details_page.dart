import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/models/cart.dart';
import 'package:rolex_boutique/models/item.dart';
import 'package:rolex_boutique/models/loading_provider.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item item;
  const ItemDetailsPage({super.key, required this.item});

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

class AddToCartButton extends StatefulWidget {
  final Item item;

  const AddToCartButton({super.key, required this.item});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  void _onTap() async {
    if (context.read<Cart>().isItemInCart(widget.item)) return;

    final loadingProvider = context.read<LoadingProvider>();

    loadingProvider.showLoading();
    await Future.delayed(const Duration(milliseconds: 500));

    HapticFeedback.mediumImpact();
    context.read<Cart>().addItemToCart(widget.item);

    loadingProvider.hideLoading();

    // Show flashbar
    context.showFlash(
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          child: FlashBar(
            controller: controller,
            content: Text(
              '${widget.item.name} added to cart',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.grey[800],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isInCart = context.watch<Cart>().isItemInCart(widget.item);

    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: isInCart ? const Color(0xFF006039) : const Color(0xFFA37E2C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isInCart
                  ? const Icon(Icons.check, color: Colors.white)
                  : const SizedBox(),
              const SizedBox(width: 10),
              Text(
                isInCart ? "Added to Cart" : "Add to Cart",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
