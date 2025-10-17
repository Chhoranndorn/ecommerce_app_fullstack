import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// Mock data for the food items in the "Curry" category.
// Replace this with your actual data.
final List<Map<String, String>> curryFoodItems = [
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
  {
    'name': 'សម្លការីសាច់ទា',
    'description': 'សម្លការីសាច់ទា ពិសេសប្រចាំហាង',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/hYyBvGd.jpeg'
  },
  {
    'name': 'សម្លម្ជូរគ្រឿង',
    'description': 'សម្លម្ជូរគ្រឿង រសជាតិជូរអែមប្រចាំហាង',
    'price': '\$ 2.00',
    'image': 'https://i.imgur.com/gK2D3z7.jpeg'
  },
  {
    'name': 'សម្លកកូរ',
    'description': 'សម្លកកូរបន្លែស្រស់ៗ ឈ្ងុយឆ្ងាញ់ពិសា',
    'price': '\$ 3.00',
    'image': 'https://i.imgur.com/V9QJ4s2.jpeg'
  },
];

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // The back arrow is automatically added by Flutter
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            // Handle back navigation if needed, e.g., Navigator.pop(context)
            Get.back();
          },
        ),
        title: const Text(
          'សម្លការី',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DottedBorder(
          color: Colors.blue.shade300,
          strokeWidth: 1.5,
          dashPattern: const [5, 5], // 5 pixels on, 5 pixels off
          radius: const Radius.circular(12),
          borderType: BorderType.RRect, // Rounded rectangle border
          child: ClipRRect(
            // ClipRRect is important to keep list items within the rounded border
            borderRadius: BorderRadius.circular(12),
            child: ListView.builder(
              itemCount: curryFoodItems.length,
              itemBuilder: (context, index) {
                final item = curryFoodItems[index];
                final bool isLastItem = index == curryFoodItems.length - 1;

                return Column(
                  children: [
                    FoodItemCard(
                      title: item['name']!,
                      description: item['description']!,
                      price: item['price']!,
                      imageUrl: item['image']!,
                    ),
                    // Add a dashed separator unless it's the last item
                    if (!isLastItem)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DottedBorder(
                          customPath: (size) => Path()..lineTo(size.width, 0),
                          color: Colors.blue.shade200,
                          strokeWidth: 1,
                          dashPattern: const [3, 4],
                          child: const SizedBox.shrink(),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// A reusable widget for displaying a single food item card.
class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
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
              height: 80,
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
