import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB89C5A),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PetAdoptionApp(),
    );
  }
}
