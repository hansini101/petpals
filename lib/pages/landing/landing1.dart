// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:petpals/global.dart';

void main() {
  runApp(PetPalsApp());
}

class PetPalsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Landing1());
  }
}

class Landing1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
        255,
        186,
        163,
        95,
      ), // Matching background color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WELCOME TO",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "PETPALS",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(children: [Image.asset("assets/pic1.jpg", width: 250)]),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    navigatorKey.currentState?.pushNamed('/landing2');
                  },
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Color.fromARGB(255, 186, 163, 95),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
