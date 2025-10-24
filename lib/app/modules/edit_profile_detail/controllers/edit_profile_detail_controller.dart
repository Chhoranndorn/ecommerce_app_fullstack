import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileDetailController extends GetxController {
  // Controllers for each text field
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController whatsappController;
  late TextEditingController telegramController;
  late TextEditingController wechatController;
  late TextEditingController addressController;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with existing data (or empty)
    // In a real app, you'd fetch this data first
    nameController = TextEditingController(text: 'Theavann');
    emailController = TextEditingController(text: 'theavann@gmail.com');
    phoneController = TextEditingController(text: '+855 123 456 78');
    whatsappController = TextEditingController(text: '+855 123 456 78');
    telegramController = TextEditingController(text: '+855 123 456 78');
    wechatController = TextEditingController(text: '+855 123 456 78');
    addressController = TextEditingController(
        text: '# 41, Street 366, Sangkat Toul Kork, Phnom Penh');
  }

  @override
  void onClose() {
    // Dispose all controllers to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    whatsappController.dispose();
    telegramController.dispose();
    wechatController.dispose();
    addressController.dispose();
    super.onClose();
  }

  // Method to handle form submission
  void submitProfile() {
    // Add your logic here to save the data
    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
    // You can get all values like this:
    // print(nameController.text);
    // print(emailController.text);
  }
}
