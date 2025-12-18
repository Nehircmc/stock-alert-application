import 'package:flutter/material.dart';
import 'notification_screen.dart';
import 'cart_screen.dart';
import 'cart_data.dart';

final List<Map<String, dynamic>> products = [
  {'name': 'Wireless Headphones', 'price': 299.99},
  {'name': 'Mechanical Keyboard', 'price': 149.99},
  {'name': 'Gaming Mouse', 'price': 79.99},
];

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(product['name']),
              subtitle: Text('Price: \$${product['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cartItems.add(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product['name']} added to cart')),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}
