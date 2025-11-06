import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolex_boutique/models/item.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item item;
  const ItemDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  bool isAdding = false;
  bool isAdded = false;

  void _onTap() async {
    if (isAdded || isAdding) return; // Prevent multiple taps

    HapticFeedback.mediumImpact();
    setState(() => isAdding = true);

    // Animate to progress indicator
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      isAdding = false;
      isAdded = true;
    });

    // Show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[800],
        content: Text(
          '${widget.item.name} added to cart',
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    // Revert button state after a delay
    await Future.delayed(const Duration(seconds: 3));
    setState(() => isAdded = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: isAdding ? 60 : MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: isAdded ? const Color(0xFF006039) : const Color(0xFFA37E2C),
          borderRadius: BorderRadius.circular(isAdding ? 30 : 12),
        ),
        child: Center(
          child: isAdding
              ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
              : isAdded
                  ? const Icon(Icons.check, color: Colors.white)
                  : const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
        ),
      ),
    );
  }
}
