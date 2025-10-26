import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  var selectedLanguage = 'en_US'.obs;

  @override
  void onInit() {
    super.onInit();
    // Get current locale
    if (Get.locale != null) {
      selectedLanguage.value =
          '${Get.locale!.languageCode}_${Get.locale!.countryCode}';
    }
  }

  void goToNotifications() {
    // You would create a Routes.NOTIFICATIONS for this
    Get.snackbar('Navigate', 'Go to Notifications screen');
  }

  void goToLanguage() {
    // Show dialog instead of navigating
    _showLanguageDialog();
  }

  void _showLanguageDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => _buildLanguageOption(
                    flag: '🇰🇭',
                    language: 'ភាសាខ្មែរ',
                    value: 'km_KH',
                  )),
              const SizedBox(height: 12),
              Obx(() => _buildLanguageOption(
                    flag: '🇬🇧',
                    language: 'អង់គ្លេស',
                    value: 'en_US',
                  )),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B9F2E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _confirmLanguageChange();
                  },
                  child: const Text(
                    'យល់ព្រម',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String flag,
    required String language,
    required String value,
  }) {
    final bool isSelected = selectedLanguage.value == value;
    return InkWell(
      onTap: () {
        selectedLanguage.value = value;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                language,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: selectedLanguage.value,
              onChanged: (val) {
                if (val != null) {
                  selectedLanguage.value = val;
                }
              },
              activeColor: const Color(0xFF6B9F2E),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmLanguageChange() {
    var localeParts = selectedLanguage.value.split('_');
    var newLocale = Locale(localeParts[0], localeParts[1]);
    Get.updateLocale(newLocale);
    Get.back(); // Close dialog
  }

  void goToPolicy() {
    // You would create a Routes.POLICY for this
    Get.snackbar('Navigate', 'Go to Service Policy screen');
  }

  void goToContact() {
    // You would create a Routes.CONTACT for this
    Get.snackbar('Navigate', 'Go to Contact Us screen');
  }
}
