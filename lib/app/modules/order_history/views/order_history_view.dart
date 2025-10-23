import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_history_controller.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({Key? key}) : super(key: key);

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
          'ប្រវត្តិ​នៃ​ការ​បញ្ជា​ទិញ', // "Order History"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 3. Body with the order card
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildOrderCard(),
          // You could add more _buildOrderCard() widgets here
        ],
      ),
    );
  }

  /// 4. Builds the white order card
  Widget _buildOrderCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ស្នើសុំ', // "Request"
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '19 តុលា 2025 10:30 AM',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF6A994E), // Greenish date text
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0), // Space before item list

          // List of Items
          _buildOrderItem(
            imagePath: Images.product1,
            name: 'សាច់ក្រកផ្អាប់',
            price: '10.00',
          ),
          _buildOrderItem(
            imagePath: Images.product2,
            name: 'ស៊ុបពងទាសម្មៃផ្អែម',
            price: '3.00',
          ),
          _buildOrderItem(
            imagePath: Images.product3,
            name: 'កាហ្វេទឹកដោះគោ',
            price: '1.00',
          ),
        ],
      ),
    );
  }

  /// 5. Helper widget for each item in the card
  Widget _buildOrderItem({
    required String imagePath,
    required String name,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Item Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.grey[200],
                  child:
                      Icon(Icons.image_not_supported, color: Colors.grey[400]),
                );
              },
            ),
          ),
          const SizedBox(width: 12.0),

          // Item Name
          Expanded(
            child: Text(
              '1 x $name',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(width: 12.0),

          // Item Price
          Text(
            '\$ $price',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
