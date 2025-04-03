import 'package:flutter/material.dart';
import 'package:petpals/pages/home/get_started.dart';
import 'pages/settings/settings_screen.dart';

void main() {
  runApp(PetpalsApp());
}

class PetpalsApp extends StatelessWidget {
  const PetpalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB89C5A),
        scaffoldBackgroundColor: Colors.white,
      ),
      home:MainScreen(),
    );
  }
}
