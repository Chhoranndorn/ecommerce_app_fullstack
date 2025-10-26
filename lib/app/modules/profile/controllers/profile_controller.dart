import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // Share app functionality
  void shareApp() {
    const String appName = 'Phum Num Banh Chok';
    const String appDescription =
        'ភូមិនំបញ្ចុក - កម្មវិធីបញ្ជាទិញអាហារតាមអនឡាញ';
    const String playStoreLink =
        'https://play.google.com/store/apps/details?id=com.phumnumbanhchok';
    const String appStoreLink = 'https://apps.apple.com/app/phumnumbanhchok';

    final String shareText = '''
$appName
$appDescription

ទាញយកកម្មវិធីឥឡូវនេះ:
Android: $playStoreLink
iOS: $appStoreLink
''';

    // Show share dialog with options
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
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
            const Text(
              'ចែករំលែកកម្មវិធី',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.copy, color: Color(0xFF84C341)),
              title: const Text('ចម្លងតំណភ្ជាប់'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: shareText));
                Get.back();
                Get.snackbar(
                  'ជោគជ័យ',
                  'បានចម្លងតំណភ្ជាប់',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color(0xFF84C341),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Color(0xFF84C341)),
              title: const Text('ចែករំលែកតាមកម្មវិធីផ្សេង'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: shareText));
                Get.back();
                Get.snackbar(
                  'ទិន្នន័យបានចម្លង',
                  'អ្នកអាចបិទភ្ជាប់ទៅកម្មវិធីផ្សេងបាន',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color(0xFF84C341),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 3),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
