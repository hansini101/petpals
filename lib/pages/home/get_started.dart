import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB42DwsA_S2-DT5agd14Xtf9Gx906pY7SU", // Replace with your API key
      appId: "1:940088749735:android:264390f623c562fb8c7582", // Replace with your App ID
      messagingSenderId: "940088749735", // Replace with your Messaging Sender ID
      projectId: "petpal-6135c", // Replace with your Project ID
    ),
  );
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
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  final Function(String) onNavigate;
  const LoginScreen({super.key, required this.onNavigate});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      widget.onNavigate('home'); // Navigate to home after successful login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 80),
          const SizedBox(height: 40),
          CustomInputField(
            icon: Icons.email_outlined,
            hintText: 'Email Address',
            controller: _emailController,
          ),
          const SizedBox(height: 40),
          CustomInputField(
            icon: Icons.lock_outline,
            hintText: 'Password',
            isPassword: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 40),
          CustomButton(text: 'Login', onTap: _login, color: const Color(0xFFB99A5E)),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => widget.onNavigate('signup'),
            child: const Text(
              'Signup',
              style: TextStyle(color: Color(0xFFB99A5E), fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => widget.onNavigate('welcome'),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  final Function(String) onNavigate;
  const SignupScreen({super.key, required this.onNavigate});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      widget.onNavigate('home'); // Navigate to home after successful signup
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

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
              CustomInputField(icon: Icons.email_outlined, hintText: 'Email', controller: _emailController),
              const SizedBox(height: 40),
              CustomInputField(
                icon: Icons.lock_outline,
                hintText: 'Password',
                isPassword: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 40),
              CustomButton(text: 'Signup', onTap: _signup, color: const Color(0xFFB99A5E)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      widget.onNavigate('login');
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
          TextButton(
            onPressed: () => onNavigate('welcome'),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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

class CustomBlackButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBlackButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xFFB99A5E),
      ),
    );
  }
}