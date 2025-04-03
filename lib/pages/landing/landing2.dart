import 'package:flutter/material.dart';
import 'package:petpals/global.dart';

class Landing2 extends StatelessWidget {
  const Landing2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            'assets/pic2.jpg', // Replace with your actual image asset
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
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
                navigatorKey.currentState?.pushNamed('/landing3');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 183, 163, 95),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
