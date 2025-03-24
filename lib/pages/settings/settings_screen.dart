import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'edit_profile_screen.dart';
import 'change_password_screen.dart';
import 'notifications_screen.dart';
import 'privacy_security_screen.dart';
import 'pet_preferences_screen.dart'; // Import Pet Preferences
import 'order_payments_screen.dart'; // Import Order & Payments

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFFB89C5A),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue[100],
            child: Icon(Icons.person, size: 40, color: Color(0xFFB89C5A)),
          ),
          const SizedBox(height: 10),
          const Text(
            "Lucas Scott",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text("@lucasscott3", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildSettingsOption(
                  context,
                  "Edit Profile",
                  EditProfileScreen(),
                ),
                _buildSettingsOption(
                  context,
                  "Change Password",
                  ChangePasswordScreen(),
                ),
                _buildSettingsOption(
                  context,
                  "Pet Preferences",
                  PetPreferencesScreen(),
                ), // Added Pet Preferences
                _buildSettingsOption(
                  context,
                  "Order & Payments",
                  OrderPaymentsScreen(),
                ), // Added Order & Payments
                _buildSettingsOption(
                  context,
                  "Notifications",
                  NotificationsScreen(),
                ),

                _buildSettingsOption(
                  context,
                  "Privacy & Security",
                  PrivacySecurityScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
    );
  }

  Widget _buildSettingsOption(
    BuildContext context,
    String title,
    Widget? destination,
  ) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
    );
  }
}
