import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_mart/petfood.dart';
import 'package:petpals/pages/pet_mart/payment.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(const CartApp());
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          CartScreen(), // Don't use 'const' here, as it causes issues in navigation
    );
  }
}

class CartScreen extends StatelessWidget {
  CartScreen({super.key}); // Removed 'const' keyword here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBAA35F),
        title: const Text(
          "Welcome Samadhi!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PetFoodApp()),
            );
          },
        ),
        actions: const [
          Icon(Icons.person, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Order details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _orderItem(
              "Josi Dog Master Mix",
              "https://th.bing.com/th/id/OIP.y10qt2eVwbjTqla9b-5qlAHaHa?w=174&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              780.50,
              680.50,
            ),
            _orderItem(
              "Pedigree Chicken & Vege",
              "https://th.bing.com/th/id/OIP.MFeqoeFcuycqZkJi8hTcnAHaHa?w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              null,
              80.00,
            ),
            const SizedBox(height: 20),
            _billDetails(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBAA35F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Pay Now",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
    );
  }

  Widget _orderItem(
    String name,
    String imageUrl,
    double? oldPrice,
    double newPrice,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text(
          "Delivery by 20th November",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (oldPrice != null)
              Text(
                "\$$oldPrice",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            Text(
              "\$$newPrice",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFBAA35F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _billDetails() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Bill details", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _billRow("MRP", "\$760.50"),
            _billRow("Product discount", "-\$10.00", color: Colors.green),
            _billRow("Item total", "\$750.50"),
            _billRow("Coupon Code", "-\$10.00", color: Colors.green),
            _billRow("Delivery Charges", "Free"),
            Divider(),
            _billRow("Bill total", "\$740.50", isTotal: true),
          ],
        ),
      ),
    );
  }
}

class _billRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  final bool isTotal;

  const _billRow(this.label, this.value, {this.color, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color ?? Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}