// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_mart/pet_mart_01.dart';
import 'package:petpals/pages/pet_mart/pet_mart_02.dart';
import 'package:petpals/pages/pet_mart/cart.dart';
import '../../widgets/bottom_nav_bar.dart';

class PetMart03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB99C52),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PetMart03Screen(),
    );
  }
}

class PetMart03Screen extends StatefulWidget {
  @override
  _PetMart03ScreenState createState() => _PetMart03ScreenState();
}

class _PetMart03ScreenState extends State<PetMart03Screen> {
  // Controller for the search text field
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB99C52),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetMart02()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/back_arrow.png',
              width: 24,
              height: 24,
              errorBuilder:
                  (context, error, stackTrace) =>
                      Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        title: Text(
          'Welcome Samadhi!',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/notification_icon.png',
                  width: 18,
                  height: 18,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/profile_icon.png',
                  width: 18,
                  height: 18,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.face_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shop',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/cart_icon.png',
                          width: 24,
                          height: 24,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  Icon(Icons.shopping_cart_outlined),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Replaced container with TextField for functional search
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        hintText: 'Search keywords...',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Image.asset(
                            'assets/search_icon.png',
                            width: 24,
                            height: 24,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    Icon(Icons.search, color: Colors.grey),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        // Handle search text changes
                        print('Search query: $value');
                        // You can implement search functionality here
                      },
                      onSubmitted: (value) {
                        // Handle search submission
                        print('Search submitted: $value');
                        // Implement search submission functionality
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetMart01(),
                            ),
                          );
                        },
                        child: _buildCategoryItem(
                          'assets/food_icon.png',
                          'Food',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetMart02(),
                            ),
                          );
                        },
                        child: _buildCategoryItem(
                          'assets/products_icon.png',
                          'Products',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetMart03(),
                            ),
                          );
                        },
                        child: _buildCategoryItem(
                          'assets/accessories_icon.png',
                          'Accessories',
                          isSelected: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Recommended Accessories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildProductCard(
                        'Automatic Pet Feeder',
                        '',
                        'Rs 24,489.00',
                        'assets/feeder.png',
                        Colors.white,
                      ),
                      _buildProductCard(
                        'GPS Pet Tracker',
                        '',
                        'Rs 30,580.00',
                        'assets/tracker.png',
                        Colors.white,
                        isNew: true,
                      ),
                      _buildProductCard(
                        'Fi Smart Collar',
                        '',
                        'Rs 9200.00',
                        'assets/collar.png',
                        Colors.white,
                      ),
                      _buildProductCard(
                        'Petcube Pet Camera',
                        '',
                        'Rs 15,965.00',
                        'assets/camera.png',
                        Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
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

  Widget _buildCategoryItem(
    String iconPath,
    String label, {
    bool isSelected = false,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFB99C52) : Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            errorBuilder:
                (context, error, stackTrace) => Icon(
                  label == 'Food'
                      ? Icons.pets
                      : label == 'Products'
                      ? Icons.toys
                      : Icons.watch,
                  color: Colors.black,
                ),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildProductCard(
    String title,
    String subtitle,
    String price,
    String image,
    Color? color, {
    bool isNew = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    height: 100,
                    fit: BoxFit.contain,
                    // For testing, we'll use a placeholder
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300],
                          child: Icon(Icons.image, color: Colors.grey),
                        ),
                  ),
                ),
              ),
              if (isNew)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                SizedBox(height: 4),
                if (price.isNotEmpty)
                  Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the Cart page when pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  const CartApp(), // Replace with your actual cart page widget
                        ),
                      );
                    },
                    child: Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor:
                          title == 'Automatic Pet Feeder'
                              ? Color(0xFFB99C52)
                              : Colors.white,
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
