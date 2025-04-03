// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption4.dart';

void main() {
  runApp(const Adoption5());
}

class Adoption5 extends StatelessWidget {
  const Adoption5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption App',
      theme: ThemeData(
        cardColor: const Color.fromARGB(255, 186, 163, 95),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PetProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PetProfileScreen extends StatelessWidget {
  const PetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Adoption4()),
            );

            // Goes back to the previous screen (Adoption1)
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black54),
            onPressed: () {
              // Open menu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPetHeader(),
            _buildPetDetails(),
            _buildActionButtons(),
            const SizedBox(height: 16),
            _buildAdoptButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPetHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Circular background
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 186, 163, 95), // Gold color
              shape: BoxShape.circle,
            ),
          ),
          // Pet image
          Positioned(
            bottom: -20,
            child: ClipOval(
              child: Image.network(
                'assets/chico.png',
                width: 170,
                height: 170,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 170,
                    height: 170,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.pets,
                      size: 50,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Chico',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Rs.30,000',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Rockey is a friendly and playful Pomeranian who loves to cuddle. He is 2 years old and gets along well with children and other pets. Rockey is house-trained and knows basic commands.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInfoTile(icon: Icons.pets, label: 'Breed', value: 'Wildcat'),
          _buildInfoTile(icon: Icons.male, label: 'Gender', value: 'Female'),
          _buildInfoTile(
            icon: Icons.access_time,
            label: 'Age',
            value: '1 Year old',
          ),
        ],
      ),
    );
  }

  Widget _buildAdoptButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          // Handle adopt action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(
            255,
            186,
            163,
            95,
          ), // Gold color
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: const Text(
          'Adopt Now',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget _buildInfoTile({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Expanded(
    child: Column(
      children: [
        Icon(icon, size: 28, color: Colors.black54),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    ),
  );
}
