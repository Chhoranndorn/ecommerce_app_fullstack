import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_success_controller.dart'; // Make sure this path is correct

class OrderSuccessView extends GetView<OrderSuccessController> {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          // Typically, for an order success screen, pressing back might go to home
          // or a specific order history. Get.offAllNamed(Routes.HOME) is common.
          // For now, it just goes back to the previous screen.
          onPressed: () => Get.back(),
        ),
        title: Text(
          "ការបញ្ជាទិញបានរួចរាល់".tr, // "Order Completed"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressBar(),
            SizedBox(height: 24),
            _buildThankYouCard(),
            SizedBox(height: 24),
            _buildOrderItemsSection(),
            SizedBox(height: 24),
            _buildOrderSummary(),
          ],
        ),
      ),
    );
  }

  /// Builds the horizontal progress bar
  Widget _buildProgressBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProgressStep(
              icon: Icons.check_circle,
              label: 'រួចរាល់'.tr, // "Completed"
              isDone: true),
          _buildProgressLine(isDone: true),
          _buildProgressStep(
              icon: Icons.assignment, // Or a document icon
              label: 'បង់ប្រាក់'.tr, // "Paid"
              isDone: true),
          _buildProgressLine(isDone: false), // Next steps are not done yet
          _buildProgressStep(
              icon: Icons.delivery_dining, // Or a package icon
              label: 'កំពុងរៀបចំ'.tr, // "Preparing"
              isDone: false),
          _buildProgressLine(isDone: false),
          _buildProgressStep(
              icon: Icons.local_shipping, // Or a delivery truck
              label: 'ដឹកជញ្ជូន'.tr, // "Delivering"
              isDone: false),
          _buildProgressLine(isDone: false),
          _buildProgressStep(
              icon: Icons.assignment_turned_in, // Or a clipboard with check
              label: 'បានប្រគល់'.tr, // "Delivered"
              isDone: false),
        ],
      ),
    );
  }

  /// Helper for each step in the progress bar
  Widget _buildProgressStep({
    required IconData icon,
    required String label,
    required bool isDone,
  }) {
    Color activeColor = Color(0xFF6A932D); // Green
    Color inactiveColor = Colors.grey.shade400;

    return Column(
      children: [
        Icon(
          icon,
          color: isDone ? activeColor : inactiveColor,
          size: 28,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isDone ? activeColor : inactiveColor,
          ),
        ),
      ],
    );
  }

  /// Helper for the connecting line in the progress bar
  Widget _buildProgressLine({required bool isDone}) {
    Color activeColor = Color(0xFF6A932D); // Green
    Color inactiveColor = Colors.grey.shade300;
    return Expanded(
      child: Container(
        height: 2,
        color: isDone ? activeColor : inactiveColor,
        margin: EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }

  /// Builds the green "Thank You" card with order details
  Widget _buildThankYouCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF6A932D), // Green
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "សូមអរគុណ".tr, // "Thank You"
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          _buildDetailRow(
            label: "លេខតាមដានការបញ្ជាទិញ".tr, // "Order Tracking Number"
            value: "OT465414184925",
            isWhite: true,
          ),
          SizedBox(height: 8),
          _buildDetailRow(
            label: "កាលបរិច្ឆេទបញ្ជាទិញ".tr, // "Order Date"
            value: "19-10-2025 / 10:30 AM",
            isWhite: true,
          ),
        ],
      ),
    );
  }

  /// Helper for rows inside the thank you card or summary
  Widget _buildDetailRow({
    required String label,
    required String value,
    bool isWhite = false, // For text color in green card
    bool isTotal = false, // For bolder total in summary
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isWhite ? Colors.white70 : Colors.grey[700],
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            color: isWhite
                ? Colors.white
                : (isTotal ? Colors.red : Colors.black87),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// Builds the list of ordered items
  /// Builds the list of ordered items
  Widget _buildOrderItemsSection() {
    // This is hardcoded mock data. You would get this from your controller.
    final List<Map<String, dynamic>> orderItems = [
      {
        'image': Images.product1, // Replace with your asset path
        'name': 'សាច់ក្រកឆ្ងាញ់', // "Delicious Sausage"
        'quantity': 1,
        'price': 10.00,
      },
      {
        'image': Images.product1, // Replace with your asset path
        'name': 'ដំបូកសុទ្ធឆ្ងាញ់', // "Pure Delicious Soup"
        'quantity': 1,
        'price': 3.00,
      },
      {
        'image': Images.product1, // Replace with your asset path
        'name': 'កាហ្វេទឹកដោះគោ', // "Milk Coffee"
        'quantity': 1,
        'price': 1.00,
      },
    ];

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ការបញ្ជាទិញទំនិញ".tr, // "Order Items"
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap:
                true, // Important for ListView inside SingleChildScrollView
            physics:
                NeverScrollableScrollPhysics(), // Disable internal scrolling
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              final item = orderItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item['image'] ?? Images.product1, // Fallback image
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        // --- THIS IS THE FIX ---
                        // Product names are dynamic data, do not use .tr
                        "${item['quantity']} x ${item['name']}",
                        // --- END OF FIX ---
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                    ),
                    Text(
                      "\$${item['price'].toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Builds the final price summary section
  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDetailRow(
              label: "ថ្លៃដឹកជញ្ជូន".tr, value: "\$1.00"), // "Delivery Fee"
          SizedBox(height: 8),
          _buildDetailRow(
              label: "សរុប".tr, value: "\$15.00", isTotal: true), // "Total"
        ],
      ),
    );
  }
}
