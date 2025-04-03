import 'package:flutter/material.dart';
import 'package:petpals/global.dart';

class Landing3 extends StatefulWidget {
  const Landing3({super.key});

  @override
  State<Landing3> createState() => _Landing3State();
}

class _Landing3State extends State<Landing3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/pic3.jpg', // Replace with your actual image asset
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
                Icon(
                  Icons.circle,
                  size: 8,
                  color: const Color.fromARGB(255, 186, 163, 95),
                ),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Find your pets with us",
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
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 186, 163, 95),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    navigatorKey.currentState?.pushNamed('/landing4');
                  },
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