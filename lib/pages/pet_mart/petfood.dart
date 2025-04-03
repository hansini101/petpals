import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_mart/cart.dart';
import 'package:petpals/pages/pet_mart/pet_mart_01.dart';
import 'package:petpals/pages/pet_mart/pet_mart_02.dart';
import 'package:petpals/pages/pet_mart/pet_mart_03.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(const PetFoodApp());
}

class PetFoodApp extends StatelessWidget {
  const PetFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetFoodScreen(),
    );
  }
}

class PetFoodScreen extends StatelessWidget {
  PetFoodScreen({super.key});

  final List<Map<String, String>> products = [
    {
      "name": "Josera Mini Deluxe",
      "price": "Rs 2900.00",
      "weight": "900g",
      "image":
          "https://th.bing.com/th/id/OIP.y10qt2eVwbjTqla9b-5qlAHaHa?w=174&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    },
    {
      "name": "Pedigree Chicken & Vege",
      "price": "Rs 5300.00",
      "weight": "3kg",
      "image":
          "https://th.bing.com/th/id/OIP.MFeqoeFcuycqZkJi8hTcnAHaHa?w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    },
    {
      "name": "BlackHawk Puppy Lamb",
      "price": "Rs 3500.00",
      "weight": "20kg",
      "image":
          "https://th.bing.com/th/id/OIP.1r5PahWEQoSCmoy-KXnsfwHaHa?rs=1&pid=ImgDetMain",
    },
    {
      "name": "Royal Canin Labrador P",
      "price": "Rs 11500.00",
      "weight": "3kg",
      "image":
          "https://th.bing.com/th/id/OIP.okrdYDcYGlD2zYvbLTpBQAHaHa?w=155&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFBAA35F),
        title: const Text(
          "Welcome Samadhi!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetMart01()),
            );
          },
        ),
        actions: const [
          Icon(Icons.person, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 15),
            _buildCategoryIcons(context),
            const SizedBox(height: 20),
            const Text(
              "Recommended Food",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(child: _buildProductGrid(context)),
          ],
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

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFBAA35F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search keywords...",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildCategoryIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _categoryIcon(Icons.fastfood, "Food", context, PetFoodApp()),
        _categoryIcon(
          Icons.production_quantity_limits,
          "Products",
          context,
          PetMart02(),
        ),
        _categoryIcon(Icons.accessibility, "Accessories", context, PetMart03()),
      ],
    );
  }

  Widget _categoryIcon(
    IconData icon,
    String label,
    BuildContext context,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: const Color(0xFFBAA35F)),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return _productCard(context, products[index]);
      },
    );
  }

  Widget _productCard(BuildContext context, Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBAA35F),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.network(product["image"]!, width: 80, height: 80),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product["price"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product["name"]!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBAA35F),
                minimumSize: const Size(double.infinity, 30),
              ),
              child: const Text(
                "Add to cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}