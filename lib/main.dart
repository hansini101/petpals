import 'package:flutter/material.dart';
import 'package:petpals/screens/landing1.dart';
import 'package:petpals/screens/landing2.dart';
import 'package:petpals/screens/landing3.dart';
import 'package:petpals/screens/landing4.dart' as landing4;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Front Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Landing3(), // Ensure Landing4 is a properly defined widget
    );
  }
}
