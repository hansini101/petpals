import 'package:flutter/material.dart';
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
        primaryColor: Color(0xFFBAA35F), // Updated Theme Color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFBAA35F)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFBAA35F),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
            child: Center( // Centering the image
              child: Image.asset(
                "assets/cat1.png",
                width: 250, // Adjusted width
                height: 250, // Adjusted height
                fit: BoxFit.contain, // Prevents stretching
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFBAA35F)),
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
                      MaterialPageRoute(builder: (context) => PetSelectionScreen()),
                    );
                  },
                  child: Text("Explore", style: TextStyle(fontSize: 18, color: Colors.white)),
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
    {"name": "Rex", "age": "3 years", "gender": "Male", "type": "Dog", "image": "assets/dog1.png"},
    {"name": "Teddy", "age": "2 years", "gender": "Male", "type": "Dog", "image": "assets/dog2.png"},
    {"name": "Cherry", "age": "1 year", "gender": "Female", "type": "Dog", "image": "assets/dog3.png"},
    {"name": "Fluffy", "age": "2 years", "gender": "Female", "type": "Cat", "image": "assets/cat1.png"},
    {"name": "Bella", "age": "1 year", "gender": "Female", "type": "Cat", "image": "assets/cat2.png"},
    {"name": "Chico", "age": "3 years", "gender": "Male", "type": "Cat", "image": "assets/cat3.png"},
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

  PetCard({required this.name, required this.age, required this.gender, required this.image});

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
          Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFBAA35F))),
          Text("$age / $gender"),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text("Adopt", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
