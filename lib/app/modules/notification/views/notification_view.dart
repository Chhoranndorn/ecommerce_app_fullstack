import 'package:e_commerce_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'ការជូនដំណឹង', // "Notification"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.myTabs,
          labelColor: const Color(0xFF6A994E),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'KantumruyPro',
          ),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'KantumruyPro',
          ),
          indicatorColor: const Color(0xFF6A994E),
          indicatorWeight: 3.0,
        ),
      ),

      // 1. UPDATED: TabBarView now includes the new UI
      body: TabBarView(
        controller: controller.tabController,
        children: [
          // Content for the first tab ("History")
          _buildHistoryList(),

          // Content for the second tab ("Operation")
          _buildOperationList(),
        ],
      ),
    );
  }

  // --- WIDGET FOR TAB 1: HISTORY (No Changes) ---
  Widget _buildHistoryList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildPromotionCard(),
        const SizedBox(height: 16.0),
        _buildPromotionCard(),
      ],
    );
  }

  Widget _buildPromotionCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF6A994E),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.card_giftcard,
              color: Color(0xFF6A994E),
              size: 30.0,
            ),
          ),
          const SizedBox(width: 16.0),
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
    );
  }

  // --- WIDGETS FOR TAB 2: OPERATION (NEW) ---

  /// 2. NEW: Builds the list for the "Operation" tab
  Widget _buildOperationList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildOperationCard(),
        // You can add more cards here
      ],
    );
  }

  /// 3. NEW: Builds the white "Request" card
  Widget _buildOperationCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        // Add a subtle border like in the image
        border: Border.all(color: Colors.grey[200]!),
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
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Divider(color: Colors.grey[200]), // Divider line
          const SizedBox(height: 12.0),

          // List of Items
          _buildOperationItem(
            imagePath: Images.product1,
            name: 'សាច់ក្រកផ្អាប់',
            price: '10.00',
          ),
          _buildOperationItem(
            imagePath: Images.product2,
            name: 'ស៊ុបពងទាសម្មៃផ្អែម',
            price: '3.00',
          ),
          _buildOperationItem(
            imagePath: Images.product3,
            name: 'កាហ្វេទឹកដោះគោ',
            price: '1.00',
          ),
        ],
      ),
    );
  }

  /// 4. NEW: Helper widget for each item in the "Operation" card
  Widget _buildOperationItem({
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
              // Add an error builder for missing images
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
