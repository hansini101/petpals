// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'pet_mart_02.dart';
import 'pet_mart_03.dart';
import 'package:petpals/pages/pet_mart/petfood.dart';

class PetMart01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB99C52),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PetMart01Screen(),
    );
  }
}

class PetMart01Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB99C52),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetMart01()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/back_arrow.png',
              width: 24,
              height: 24,
              errorBuilder:
                  (context, error, stackTrace) =>
                      Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        title: const Text(
          'Welcome Samadhi!',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/notification_icon.png',
                  width: 18,
                  height: 18,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/profile_icon.png',
                  width: 18,
                  height: 18,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.face_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB99C52), Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 130),
            Image.asset('assets/pet mart.png', height: 70),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryButton(
                  imagePath: 'assets/food_icon.png',
                  label: "Food",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetFoodApp()),
                    );
                  },
                ),
                CategoryButton(
                  imagePath: 'assets/products_icon.png',
                  label: "Products",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetMart02()),
                    );
                  },
                ),
                CategoryButton(
                  imagePath: 'assets/accessories_icon.png',
                  label: "Accessories",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetMart03()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Image.asset('assets/dalmatian.png', height: 260),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB99C52),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                // Navigate to PetMart02 when Start button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetMart02()),
                );
              },
              child: Text(
                "Start",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  CategoryButton({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFD8DDDC),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Image.asset(imagePath, color: Colors.black),
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
