import 'package:flutter/material.dart';

class Landing2 extends StatelessWidget {
Landing2({Key? key}) : super(key: key);

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
          const Spacer(),
          const Text(
            "Take care of your pets",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "while you sit and stay - we'll go\nout and play",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.brown, // Active indicator
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 10,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300, // Inactive indicators
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 10,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 196, 161, 81),
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
          const SizedBox(height: 40),
        ],
      ),
    );
}
}