import 'package:flutter/material.dart';


class Landing4 extends StatefulWidget {
  const Landing4({super.key});

  @override
  State<Landing4> createState() => _Landing4State();
}

class _Landing4State extends State<Landing4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/pic4.jpg', // Ensure this asset exists
              width: 300,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
                const SizedBox(width: 5),
                const Icon(Icons.circle, size: 8, color: Color(0xFFBAA35F)),
                const SizedBox(width: 5),
                Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Nourish your pet Anytime, Anywhere!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "while you sit and stay - we'll go out and play",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBAA35F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()), // Navigate to MainScreen
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
