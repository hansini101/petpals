// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:petpals/pages/pet_mart/pet_mart_01.dart';
import 'package:petpals/pages/pet_mart/pet_mart_03.dart';
import 'package:petpals/pages/pet_mart/cart.dart ';
import '../../widgets/bottom_nav_bar.dart';

class PetMart02 extends StatelessWidget {
  const PetMart02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB99C52),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PetMart02Screen(),
    );
  }
}

class PetMart02Screen extends StatefulWidget {
  const PetMart02Screen({super.key});

  @override
  State<PetMart02Screen> createState() => _PetMart02ScreenState();
}

class _PetMart02ScreenState extends State<PetMart02Screen> {
  // Adding controller for search text field
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when widget is removed
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildCategoryItem(
    String imagePath,
    String label, {
    bool isSelected = false,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFFB99C52) : const Color(0xFFEEEEEE),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 24,
            height: 24,
            errorBuilder:
                (context, error, stackTrace) => Icon(
                  label == 'Food'
                      ? Icons.pets
                      : label == 'Products'
                      ? Icons.shopping_bag
                      : Icons.pets_outlined,
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? const Color(0xFFB99C52) : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB99C52),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetMart01()),
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
        title: const Text(
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shop',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/cart_icon.png',
                        width: 24,
                        height: 24,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Replace container with TextField for functional search
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
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
                            color: Colors.grey,
                            errorBuilder:
                                (context, error, stackTrace) => const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
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
                  const SizedBox(height: 20),
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
                          isSelected: true,
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Recommended Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: const [
                      ProductCard(
                        title: 'Wet Dog - Flea & Tick...',
                        subtitle: '210ml',
                        price: 'Rs 700.00',
                        image: 'assets/shampoo.png',
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                      ProductCard(
                        title: 'Oronda Spray',
                        subtitle: '250ml',
                        price: 'Rs 2,800.00',
                        image: 'assets/oronda.png',
                        backgroundColor: Color(0xFFEEEEEE),
                        isNew: true,
                      ),
                      ProductCard(
                        title: 'Nexgard - Afoxolaner',
                        subtitle: '136mg',
                        price: 'Rs 3,480.00',
                        image: 'assets/tablet.png',
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                      ProductCard(
                        title: 'Petro Mange Cream',
                        subtitle: '70g',
                        price: 'Rs 650.00',
                        image: 'assets/cream.png',
                        backgroundColor: Color(0xFFEEEEEE),
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
}

class CategoryItemWithImage extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItemWithImage({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 24,
            height: 24,
            errorBuilder:
                (context, error, stackTrace) => Icon(
                  label == 'Food'
                      ? Icons.pets
                      : label == 'Products'
                      ? Icons.shopping_bag
                      : Icons.pets_outlined,
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final Color backgroundColor;
  final bool isNew;

  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.backgroundColor,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000), // Alpha 13 (0.05 opacity)
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
                height: 100,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          width: 80,
                          height: 80,
                          color: const Color(0xFFE0E0E0),
                          child: const Icon(Icons.image, color: Colors.grey),
                        ),
                  ),
                ),
              ),
              if (isNew)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
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
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigate to the Cart page when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const CartApp(), // Replace with the actual cart page widget
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/add_cart_icon.png',
                            width: 14,
                            height: 14,
                            errorBuilder:
                                (context, error, stackTrace) => const Icon(
                                  Icons.add_shopping_cart,
                                  size: 14,
                                  color: Colors.black,
                                ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Add to cart',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
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
