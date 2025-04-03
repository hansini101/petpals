import 'package:flutter/material.dart';
import 'package:petpals/pages/landing/landing1.dart';
import 'package:petpals/pages/landing/landing2.dart';
import 'package:petpals/pages/landing/landing3.dart';
import 'package:petpals/pages/landing/landing4.dart';
import 'global.dart';

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
      home: Landing1(),
      routes: {
        '/landing1': (context) => Landing1(),
        '/landing2': (context) => Landing2(),
        '/landing3': (context) => Landing3(),
        '/landing4': (context) => Landing4(),
      },
      navigatorKey: navigatorKey,
    );
  }
}
