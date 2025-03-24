import 'package:flutter/material.dart';
import 'package:petpals/pages/settings/settings_screen.dart';
import 'package:petpals/pages/home.dart';
import 'package:petpals/pages/pet_care.dart';
import 'package:petpals/pages/pet_shop.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        debugPrint("Tapped index: $index"); // Debugging
        onTabChange(index);
      },
      backgroundColor: const Color(0xFFC4B177), // Brown color
      selectedItemColor: Colors.white, // Selected item color
      unselectedItemColor: Colors.white70, // Unselected item color
      type: BottomNavigationBarType.fixed, // Ensures all labels are visible
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pet Care'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Pet Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    debugPrint("Changing index to: $index"); // Debugging
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomePage(),
    const PetCarePage(),
    const PetShopPage(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Directly switching the body
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
