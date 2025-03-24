import 'package:flutter/material.dart';
import 'package:petpals/widgets/bottom_nav_bar.dart';

class PetCarePage extends StatelessWidget {
  const PetCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Care"),
        backgroundColor: Color(0xFFB89C5A),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.health_and_safety,
              size: 80,
              color: Color(0xFFB89C5A),
            ),
            const SizedBox(height: 10),
            const Text(
              "Caring for Your Pet",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Find tips and guidance on keeping your pet healthy and happy.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
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
}
