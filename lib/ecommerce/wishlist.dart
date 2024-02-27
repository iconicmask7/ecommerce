import 'package:flutter/material.dart';
import 'paymentpage.dart';

class WishlistPage extends StatefulWidget {
  final List<WishlistItem> wishlistItems;

  WishlistPage({super.key, required this.wishlistItems});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  Set<WishlistItem> wishlistItems = {};

  @override
  void initState() {
    super.initState();
    wishlistItems.addAll(widget.wishlistItems);
  }

  void toggleWishlistItem(WishlistItem item) {
    setState(() {
      if (wishlistItems.contains(item)) {
        wishlistItems.remove(item);
      } else {
        wishlistItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalAmount = wishlistItems.fold<int>(0, (sum, item) => sum + item.price);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems.elementAt(index);
          return ListTile(
            title: Text(item.name),
            subtitle: Text('₹${item.price}'),
            onTap: () {
              toggleWishlistItem(item);
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage(totalAmount: totalAmount, gstRate: 0.02)),
            );
          },
          child: Text('Purchase Total: ₹$totalAmount'),
        ),
      ),
    );
  }
}

class WishlistItem {
  final String name;
  final int price;

  WishlistItem({required this.name, required this.price});
}
