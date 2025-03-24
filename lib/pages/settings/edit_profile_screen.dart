import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Color(0xFFB89C5A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.blue[100]),
            SizedBox(height: 20),
            _buildTextField("Full Name"),
            _buildTextField("Email"),
            _buildTextField("Phone Number"),
            _buildTextField("Bio"),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB89C5A),
              ),
              onPressed: () {},
              child: Text("Save"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
