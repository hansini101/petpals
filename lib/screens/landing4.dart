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
            Spacer(),
            Image.asset(
              'assets/pic4.jpg', // Replace with your actual image asset
              width: 300,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 8, color: Colors.amber.shade600),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Nourish your pet Anytime, Anywhere!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "while you sit and stay - we'll go out and play",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}