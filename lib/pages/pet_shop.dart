import 'package:flutter/material.dart';
import 'package:petpals/widgets/bottom_nav_bar.dart';

class PetShopPage extends StatelessWidget {
  const PetShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Shop"),
        backgroundColor: Color(0xFFB89C5A),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 80, color: Color(0xFFB89C5A)),
            const SizedBox(height: 10),
            const Text(
              "Find the Best for Your Pet",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Browse a variety of pet supplies, food, and accessories.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
    );
  }
}
