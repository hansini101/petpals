import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption1.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption2.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption3.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption4.dart';
import 'package:petpals/pages/pet_adoption/pet_adoption5.dart';

import 'package:petpals/widgets/bottom_nav_bar.dart';

void main() {
  runApp(PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFBAA35F),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFBAA35F)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFBAA35F),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/cat1.png",
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Find your favourite pet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBAA35F),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "We have a variety of lovely pets waiting for a home!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetSelectionScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Explore",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pet Selection Screen
class PetSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> pets = [
    {
      "name": "Rex",
      "age": "3 years",
      "gender": "Male",
      "type": "Dog",
      "image": "assets/dog1.png",
    },
    {
      "name": "Teddy",
      "age": "2 years",
      "gender": "Male",
      "type": "Dog",
      "image": "assets/dog2.png",
    },
    {
      "name": "Cherry",
      "age": "1 year",
      "gender": "Female",
      "type": "Dog",
      "image": "assets/dog3.png",
    },
    {
      "name": "Fluffy",
      "age": "2 years",
      "gender": "Female",
      "type": "Cat",
      "image": "assets/cat1.png",
    },
    {
      "name": "Bella",
      "age": "1 year",
      "gender": "Female",
      "type": "Cat",
      "image": "assets/cat2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Your Pet")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: pets.length,
          itemBuilder: (context, index) {
            var pet = pets[index];
            return PetCard(
              name: pet["name"]!,
              age: pet["age"]!,
              gender: pet["gender"]!,
              image: pet["image"]!,
              index: index,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
    );
  }
}

// Pet Card Widget
class PetCard extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String image;
  final int index; // Used to determine the correct adoption screen

  PetCard({
    required this.name,
    required this.age,
    required this.gender,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.broken_image, size: 80, color: Colors.grey);
            },
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFBAA35F),
            ),
          ),
          Text("$age / $gender"),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _navigateToAdoptionScreen(context, index);
            },
            child: Text("Adopt", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _navigateToAdoptionScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Adoption1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Adoption2()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Adoption3()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Adoption4()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Adoption5()),
        );
        break;
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Adoption1()),
        );
    }
  }
}
