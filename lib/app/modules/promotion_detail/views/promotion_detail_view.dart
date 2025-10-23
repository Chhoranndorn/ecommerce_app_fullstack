import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/promotion_detail_controller.dart';

class PromotionDetailView extends GetView<PromotionDetailController> {
  const PromotionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Light purple background
      backgroundColor: const Color(0xFFF3F0F8),

      // 2. AppBar (This part was correct)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'ព័ត៌មានលម្អិតពីប្រម៉ូសិន',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 3. Body with the single promotion card
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPromotionCard(),
          ],
        ),
      ),
    );
  }

  /// This widget builds the entire card, including the
  /// banner, green date bar, and white description area.
  Widget _buildPromotionCard() {
    return Container(
      // Add shadow and rounded corners for the whole card
      decoration: BoxDecoration(
        color: Colors.white, // The description area background
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // ClipRRect ensures the image inside respects the rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 4. Banner Image + Date Overlay
            Stack(
              children: [
                // The banner image
                Image.asset(
                  Images.product1, // Your banner image
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // You might need to adjust the height
                  height: 200,
                ),

                // The green date bar overlaid at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    // Using the green color from your first screen
                    color: const Color(0xFF6A994E),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Combined Text as shown in the image
                        Text(
                          'ថ្ងៃចាប់ផ្តើម៖ 19 តុលា 2025',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'ថ្ងៃបញ្ចប់៖ 30 តុលា 2025',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // 5. White Description Area
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Correct title from your image
                  Text(
                    'ការពិពណ៌នា',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Description text
                  Text(
                    'ជាទូទៅ, ប្រម៉ូសិនគឺជាការរំលឹកដល់លក្ខខណ្ឌការបន្តិចម្តងៗដើម្បីទទួលបានការបញ្ចុះ '
                    'តម្លៃពិសេសសម្រាប់អ្នក។ អ្នកអាចនឹងទទួលបានការបញ្ចុះតម្លៃនិងលក្ខខណ្ឌផ្សេងៗជាច្រើនទៀត។',
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5, // Improves readability
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
