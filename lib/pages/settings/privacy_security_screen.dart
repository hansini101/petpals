import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrivacySecurityScreenState createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool dataCollectionEnabled = true;
  bool adTrackingEnabled = false;
  bool expanded1 = false;
  bool expanded2 = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy & Security"),
        backgroundColor: const Color(0xFFB89C5A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Data Collection
            ListTile(
              title: const Text(
                "1. Types of data we collect",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(expanded1 ? Icons.expand_less : Icons.expand_more),
              onTap: () {
                setState(() {
                  expanded1 = !expanded1;
                });
              },
            ),
            if (expanded1)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  "We collect your pet’s information, location, and health details to improve your experience.",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),

            // Section 2: Use of Data
            ListTile(
              title: const Text(
                "2. Use of your personal data",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(expanded2 ? Icons.expand_less : Icons.expand_more),
              onTap: () {
                setState(() {
                  expanded2 = !expanded2;
                });
              },
            ),
            if (expanded2)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  "Your data helps us provide better pet care recommendations and a personalized experience.",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),

            const SizedBox(height: 20),

            // Toggle for Data Collection
            SwitchListTile(
              title: const Text("Enable Data Collection"),
              subtitle: const Text(
                "Allow PetPal to collect data for better services.",
              ),
              value: dataCollectionEnabled,
              onChanged: (value) {
                setState(() {
                  dataCollectionEnabled = value;
                  _showSnackBar(
                    value
                        ? "Data collection enabled"
                        : "Data collection disabled",
                  );
                });
              },
            ),

            // Toggle for Ad Tracking
            SwitchListTile(
              title: const Text("Enable Ad Tracking"),
              subtitle: const Text("Show personalized pet-related ads."),
              value: adTrackingEnabled,
              onChanged: (value) {
                setState(() {
                  adTrackingEnabled = value;
                  _showSnackBar(
                    value ? "Ad tracking enabled" : "Ad tracking disabled",
                  );
                });
              },
            ),

            const SizedBox(height: 20),

            // Accept & Decline Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    _showSnackBar("Privacy settings declined");
                  },
                  child: const Text("Decline"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB89C5A),
                  ),
                  onPressed: () {
                    _showSnackBar("Privacy settings accepted");
                  },
                  child: const Text("Accept"),
                ),
              ],
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
}
