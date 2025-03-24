import 'package:flutter/material.dart';

class PetPreferencesScreen extends StatefulWidget {
  const PetPreferencesScreen({super.key});

  @override
  PetPreferencesScreenState createState() =>
      PetPreferencesScreenState(); // Fixed private state class issue
}

class PetPreferencesScreenState extends State<PetPreferencesScreen> {
  String? selectedPetType;
  List<String> petTypes = ["Dog", "Cat", "Bird", "Fish", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Preferences"),
        backgroundColor: const Color(0xFFB89C5A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select your preferred pet type:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedPetType,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              items: petTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPetType = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Save pet preference logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB89C5A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded edges
                  ),
                  elevation: 5, // Adds depth effect
                ),
                child: const Text(
                  "Save Preferences",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
