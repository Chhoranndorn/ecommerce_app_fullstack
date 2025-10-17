import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you are using GetX for navigation

// Mock data for search results.
// Replace this with your actual data from your controller/API.
final List<Map<String, String>> searchProducts = [
  {
    'name': 'សាច់ក្រកឆ្ងាញ់',
    'description': 'សាច់ក្រកឆ្ងាញ់មានរសជាតិឈ្ងុយឆ្ងាញ់ប្រចាំខេត្តកំពត',
    'price': '\$ 10.00',
    'image': 'https://i.imgur.com/L4yL4vX.png' // Example image for sausage
  },
  {
    'name': 'នំបញ្ចុកសម្លខ្មែរ ញាំ',
    'description': 'នំបញ្ចុកសម្លខ្មែរ ពីធម្មជាតិពិតៗមានរសជាតិឈ្ងុយឆ្ងាញ់',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/Y3MMaEG.png' // Example image for noodles
  },
  {
    'name': 'កាហ្វេទឹកដោះគោ',
    'description': 'កាហ្វេទឹកដោះគោមានរសជាតិផ្អែមល្មម និងស្រាលស្រទន់',
    'price': '\$ 1.00',
    'image': 'https://i.imgur.com/1Gv21G9.jpeg' // Example image for coffee
  },
  {
    'name': 'សម្លការីសាច់គោ',
    'description': 'សម្លការីសាច់គោ បន្លែគ្រប់មុខឈ្ងុយឆ្ងាញ់',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/zWb6p3H.jpeg'
  },
  {
    'name': 'សម្លការីសាច់មាន់',
    'description': 'សម្លការីសាច់មាន់ រស់ជាតិដើមពីអ្នកបាត់ដំបង',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/6a5wO3a.jpeg'
  },
];

class SearchProductView extends StatelessWidget {
  const SearchProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light grey background
      body: SafeArea(
        child: Column(
          children: [
            // Custom Search Bar
            _buildSearchBar(context),
            // Expanded list of search results
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: searchProducts.length,
                itemBuilder: (context, index) {
                  final product = searchProducts[index];
                  return ProductSearchCard(
                    title: product['name']!,
                    description: product['description']!,
                    price: product['price']!,
                    imageUrl: product['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the custom search bar with back, search input, location button, and cart icon.
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Get.back(); // Use Get.back() for GetX navigation
            },
          ),
          const SizedBox(width: 8),
          // Search Input Field
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ស្វែងរក...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Location Button
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "ទីតាំង",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Cart Icon
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Colors.black, size: 28),
            onPressed: () {
              // Navigate to Cart page
              // Get.toNamed(Routes.CART);
            },
          ),
        ],
      ),
    );
  }
}

/// A reusable widget for displaying a single product search result card.
class ProductSearchCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const ProductSearchCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 80, // Maintain consistent height for content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
