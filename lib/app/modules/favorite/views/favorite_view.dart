import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Light purple background
      backgroundColor: const Color(0xFFF3F0F8),

      // 2. AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'បញ្ជីចូលចិត្ត', // "Favorite List"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 3. Body with a list of favorite items
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFavoriteItem(),
          // You can add more _buildFavoriteItem() widgets here
        ],
      ),
    );
  }

  /// This widget builds the favorite item card.
  Widget _buildFavoriteItem() {
    return Container(
      // 4. White card with rounded corners and shadow
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      // This clips the child (the Stack) to the rounded corners
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 5. The card content (image and text)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Item Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    Images.product1, // Make sure this path is correct
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.grey[200],
                        child: Icon(Icons.image_not_supported,
                            color: Colors.grey[400]),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16.0),

                // Text Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'សាច់ក្រកផ្អាប់',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '1 គីឡូ', // "1 kg"
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '\$ 10.00',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A994E), // Green price
                        ),
                      ),
                    ],
                  ),
                ),
                // Add some empty space to prevent text from
                // going under the heart button
                const SizedBox(width: 40),
              ],
            ),
          ),

          // 6. The green heart "bookmark" button
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Color(0xFF6A994E),
                // This creates the specific bookmark shape
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
