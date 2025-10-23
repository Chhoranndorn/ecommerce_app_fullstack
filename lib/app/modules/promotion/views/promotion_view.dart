import 'package:e_commerce_app/app/modules/promotion/controllers/promotion_controller.dart';
import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromotionView extends GetView<PromotionController> {
  const PromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Set the light purple background color for the whole screen
      backgroundColor: const Color(0xFFF3F0F8),

      // 2. Build the AppBar
      appBar: AppBar(
        // Set background to white and remove shadow
        backgroundColor: Colors.white,
        elevation: 0,

        // Back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),

        // Title text in Khmer
        title: const Text(
          'ប្រវត្តិ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 3. Build the body with the green card
      body: Padding(
        // Add horizontal and vertical padding
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPromotionCard(),
            // You can add more list items here
          ],
        ),
      ),
    );
  }

  // Helper widget for the green card
  Widget _buildPromotionCard() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PROMOTION_DETAIL);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF6A994E), // Green background
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            // 4. White circle with gift icon
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.card_giftcard,
                color: Color(0xFF6A994E), // Green icon
                size: 30.0,
              ),
            ),
            const SizedBox(width: 16.0),

            // 5. Column for the two lines of text
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ប្រម៉ូសិនពិសេស',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  '19 តុលា 25, 4:51:10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
