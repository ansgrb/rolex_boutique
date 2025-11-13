import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/features/cart/presentation/manager/cart_provider.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';
import 'package:rolex_boutique/app/presentation/manager/loading_provider.dart';

class AddToCartButton extends StatefulWidget {
  final Item item;

  const AddToCartButton({super.key, required this.item});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  void _onTap() async {
    if (context.read<CartProvider>().isItemInCart(widget.item)) return;

    final loadingProvider = context.read<LoadingProvider>();

    loadingProvider.showLoading();
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    HapticFeedback.mediumImpact();
    context.read<CartProvider>().addItemToCart(widget.item);

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
    bool isInCart = context.watch<CartProvider>().isItemInCart(widget.item);

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
