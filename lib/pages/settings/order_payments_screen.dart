import 'package:flutter/material.dart';

class OrderPaymentsScreen extends StatelessWidget {
  const OrderPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order & Payments"),
        backgroundColor: Color(0xFFB89C5A),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Payment Methods",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.credit_card, color: Color(0xFFB89C5A)),
                title: Text("Visa **** 1234"),
                subtitle: Text("Expires 12/24"),
                trailing:
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  // Navigate to manage payment methods
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Order History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: List.generate(3, (index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading:
                          Icon(Icons.shopping_bag, color: Color(0xFFB89C5A)),
                      title: Text("Order #00${index + 1}"),
                      subtitle: Text("Placed on 10/02/2025"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey),
                      onTap: () {
                        // Navigate to order details
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
