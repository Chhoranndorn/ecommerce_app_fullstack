import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletHistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // For the TabBar
  late TabController tabController;

  // For the convert points dialog
  late TextEditingController pointsController;

  // Dummy data for the lists
  final List<Map<String, String>> walletTransactions = [
    {'title': 'បញ្ចូលទៅក្នុងកាបូប', 'date': '19-តុលា-2025', 'amount': '1.00'},
    {'title': 'បញ្ចូលទៅក្នុងកាបូប', 'date': '19-តុលា-2025', 'amount': '1.00'},
    {'title': 'បញ្ចូលទៅក្នុងកាបូប', 'date': '19-តុលា-2025', 'amount': '1.00'},
    {'title': 'បញ្ចូលទៅក្នុងកាបូប', 'date': '19-តុលា-2025', 'amount': '1.00'},
    {'title': 'បញ្ចូលទៅក្នុងកាបូប', 'date': '19-តុលា-2025', 'amount': '1.00'},
  ];

  final List<Map<String, String>> pointsTransactions = [
    {'title': 'ទទួលបានពិន្ទុ', 'date': '19-តុលា-2025', 'amount': '1'},
    {'title': 'ទទួលបានពិន្ទុ', 'date': '19-តុលា-2025', 'amount': '1'},
    {'title': 'ទទួលបានពិន្ទុ', 'date': '19-តុលា-2025', 'amount': '2'},
    {'title': 'ទទួលបានពិន្ទុ', 'date': '19-តុលា-2025', 'amount': '1'},
  ];

  final List<Map<String, String>> withdrawnTransactions = [
    {'title': 'ដកបាន', 'date': '19-តុលា-2025', 'amount': '1'},
    {'title': 'ដកបាន', 'date': '19-តុលា-2025', 'amount': '1'},
    {'title': 'ដកបាន', 'date': '19-តុលា-2025', 'amount': '2'},
    {'title': 'ដកបាន', 'date': '19-តុលា-2025', 'amount': '1'},
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    pointsController = TextEditingController(text: '0');
  }

  @override
  void onClose() {
    tabController.dispose();
    pointsController.dispose();
    super.onClose();
  }

  // --- Logic for Convert Points Bottom Sheet ---
  void showConvertPointsDialog() {
    // This green color should be defined in your app's theme or constants
    const Color primaryGreen = Color(0xFF6A994E);

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ពិន្ទុរបស់អ្នក: 10 ពិន្ទុ', // Your points: 10 Points
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '10 ពិន្ទុ = \$ 1.00', // 10 Points = $ 1.00
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: pointsController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add your conversion logic here
                Get.back(); // Close the bottom sheet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'បម្លែង', // Convert
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true, // Important for keyboard
    );
  }
}
