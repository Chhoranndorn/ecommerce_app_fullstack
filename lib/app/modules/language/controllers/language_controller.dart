import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  // Add your controller variables and methods here// .obs makes this variable reactive
  var selectedLanguage = 'km_KH'.obs;

  // Method to update the selected language
  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
  }

  // Method called by the "Continue" button
  void continueToNextScreen() {
    // 1. Get the selected language code
    var localeParts = selectedLanguage.value.split('_');
    var newLocale = Locale(localeParts[0], localeParts[1]);

    // 2. Update the app's locale using GetX
    Get.updateLocale(newLocale);

    // 3. Navigate to the Home screen and remove this screen
    //    so the user can't go "back" to language selection.
    // Get.offNamed(Routes.HOME);
    if (Get.previousRoute == Routes.SETTING) {
      Get.back();
    } else {
      Get.offNamed(Routes.SIGNIN);
    }
  }
}
