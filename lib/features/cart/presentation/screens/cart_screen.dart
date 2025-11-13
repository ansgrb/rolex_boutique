import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:rolex_boutique/features/cart/presentation/widgets/invoice_dialog.dart';
import 'package:rolex_boutique/features/cart/presentation/manager/cart_provider.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Padding(
                padding: EdgeInsets.only(left: 25.0, top: 25.0, bottom: 20.0),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
              ),

              // Cart Items
              Expanded(
                child: value.userCart.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Your cart is empty...",
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          Item individualItem = value.userCart[index];

                          return CartItemWidget(
                            item: individualItem,
                            onPressed: () =>
                                Provider.of<CartProvider>(context, listen: false)
                                    .removeItemFromCart(individualItem),
                            onIncrement: () =>
                                Provider.of<CartProvider>(context, listen: false)
                                    .incrementItemQuantity(individualItem),
                            onDecrement: () =>
                                Provider.of<CartProvider>(context, listen: false)
                                    .decrementItemQuantity(individualItem),
                          );
                        },
                      ),
              ),

              // Pay Now Button
              if (value.userCart.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const InvoiceDialog(),
                      );
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA37E2C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
