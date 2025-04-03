import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petpals/pages/petcare/petcare.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption.dart';
import 'package:petpals/pages/pet_mart/pet_mart_01.dart';
void main() {
  runApp(const PetPalsApp());
}

class PetPalsApp extends StatelessWidget {
  const PetPalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB99A5E),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String currentView = 'welcome';

  void changeView(String view) {
    setState(() {
      currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentView(),
    );
  }

  Widget _buildCurrentView() {
    switch (currentView) {
      case 'login':
        return LoginScreen(onNavigate: changeView);
      case 'signup':
        return SignupScreen(onNavigate: changeView);
      case 'home':
        return HomePage(onNavigate: changeView);
      default:
        return WelcomeScreen(onNavigate: changeView);
    }
  }
}

class WelcomeScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const WelcomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => onNavigate('login'),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => onNavigate('signup'),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Function(String) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB99A5E), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            const SizedBox(height: 40),
            CustomBlackButton(
              text: 'PET CARE',
              icon: FontAwesomeIcons.paw,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetCareApp()),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomBlackButton(
              text: 'PET ADOPTION',
              icon: FontAwesomeIcons.heart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetAdoptionApp()),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomBlackButton(
              text: 'PET MART',
              icon: FontAwesomeIcons.shoppingCart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetMart01()),
                );
              },
            ),
            const SizedBox(height: 40),
            Image.asset('assets/img02.png', height: 300, fit: BoxFit.cover),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => onNavigate('welcome'),
              child: const Text('Back', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBlackButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const CustomBlackButton({super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: const Color(0xFFB99A5E)),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xFFB99A5E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// Placeholder classes for missing pages
class LoginScreen extends StatelessWidget {
  final Function(String) onNavigate;
  const LoginScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => onNavigate('home'),
          child: const Text('Login Success! Go to Home'),
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  final Function(String) onNavigate;
  const SignupScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => onNavigate('home'),
          child: const Text('Signup Success! Go to Home'),
        ),
      ),
    );
  }
}