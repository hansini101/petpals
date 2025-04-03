import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const PetpalsApp());
}

class PetpalsApp extends StatelessWidget {
  const PetpalsApp({super.key});

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/logo.png', height: 100),
        const SizedBox(height: 40),
        CustomButton(text: 'Login', onTap: () => onNavigate('login'), color: const Color(0xFFB99A5E)),
        const SizedBox(height: 40),
        CustomButton(text: 'Signup', onTap: () => onNavigate('signup'), color: const Color(0xFFB99A5E)),
        const SizedBox(height: 40),
        Image.asset('assets/img01.png', height: 400, fit: BoxFit.cover),
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  final Function(String) onNavigate;
  const LoginScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 80),
          const SizedBox(height: 40),
          const CustomInputField(icon: Icons.email_outlined, hintText: 'Email Address'),
          const SizedBox(height: 40),
          const CustomInputField(icon: Icons.lock_outline, hintText: 'Password', isPassword: true),
          const SizedBox(height: 40),
          CustomButton(text: 'Login', onTap: () => onNavigate('home'), color: const Color(0xFFB99A5E)),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => onNavigate('signup'),
            child: const Text('Signup', style: TextStyle(color: Color(0xFFB99A5E), fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          CustomLoginButton(icon: FontAwesomeIcons.google, text: 'Login with Google', onTap: () {}),
          const SizedBox(height: 20),
          CustomLoginButton(icon: FontAwesomeIcons.facebook, text: 'Login with Facebook', onTap: () {}),
          const SizedBox(height: 20),
          CustomLoginButton(icon: FontAwesomeIcons.apple, text: 'Login with Apple', onTap: () {}),
          const SizedBox(height: 10),
          TextButton(onPressed: () => onNavigate('welcome'), child: const Text('Back')),
        ],
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 100, width: 100),
              const SizedBox(height: 40),
              const CustomInputField(icon: Icons.person_outline, hintText: 'Full Name'),
              const SizedBox(height: 20),
              const CustomInputField(icon: Icons.email_outlined, hintText: 'Email'),
              const SizedBox(height: 20),
              const CustomInputField(icon: Icons.lock_outline, hintText: 'Password', isPassword: true),
              const SizedBox(height: 20),
              const CustomInputField(icon: Icons.phone_outlined, hintText: 'Phone number'),
              const SizedBox(height: 30),
              CustomButton(text: 'Signup', onTap: () {}, color: const Color(0xFFB99A5E)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      onNavigate('login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFB99A5E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
    return Container(
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
          CustomBlackButton(text: 'PET CARE', onTap: () {}),
          const SizedBox(height: 40),
          CustomBlackButton(text: 'PET ADOPTION', onTap: () {}),
          const SizedBox(height: 20),
          CustomBlackButton(text: 'PET MART', onTap: () {}),
          const Spacer(),
          Image.asset('assets/img02.png', height: 400, fit: BoxFit.cover),
          TextButton(onPressed: () => onNavigate('welcome'), child: const Text('Back')),
        ],
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomLoginButton({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
    );
  }
}

class CustomBlackButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBlackButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Color(0xFFB99A5E)),
    );
  }
}
