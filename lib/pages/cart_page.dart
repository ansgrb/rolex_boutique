import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/components/cart_item.dart';
import 'package:rolex_boutique/components/invoice_dialog.dart';
import 'package:rolex_boutique/models/cart.dart';
import 'package:rolex_boutique/models/item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
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
                child: value.getUserCart().isEmpty
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
                        itemCount: value.getUserCart().length,
                        itemBuilder: (context, index) {
                          Item individualItem = value.getUserCart()[index];

                          return CartItem(
                            item: individualItem,
                            onPressed: () =>
                                Provider.of<Cart>(context, listen: false)
                                    .removeItemFromCart(individualItem),
                            onIncrement: () =>
                                Provider.of<Cart>(context, listen: false)
                                    .incrementItemQuantity(individualItem),
                            onDecrement: () =>
                                Provider.of<Cart>(context, listen: false)
                                    .decrementItemQuantity(individualItem),
                          );
                        },
                      ),
              ),

              // Pay Now Button
              if (value.getUserCart().isNotEmpty)
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
