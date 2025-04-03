import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:petpals/pages/home/get_started.dart';
 // Ensure this file exists

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase manually using the JSON data
    await Firebase.initializeApp(
      options: FirebaseOptions(
        appId: '1:940088749735:android:264390f623c562fb8c7582', // From google-services.json
        apiKey: 'AIzaSyB42DwsA_S2-DT5agd14Xtf9Gx906pY7SU', // From google-services.json
        projectId: 'petpal-6135c', // From google-services.json
        messagingSenderId: '940088749735', // From google-services.json
        storageBucket: 'petpal-6135c.firebasestorage.app', // From google-services.json
      ),
    );
    print("🔥 Firebase Initialized Successfully");
  } catch (e) {
    print("❌ Firebase Initialization Error: $e");
  }

  runApp(PetpalsApp());
}

class PetpalsApp extends StatelessWidget {
  const PetpalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFFB89C5A),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(), // ✅ Ensure LoadingScreen is the first screen
    );
  }
}