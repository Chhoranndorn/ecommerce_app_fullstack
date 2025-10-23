import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // To control the form fields
  late TextEditingController nameController;
  late TextEditingController emailController;

  // To toggle between "Edit" and "Save"
  var isEditing = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with default values
    nameController = TextEditingController(text: 'Theavann');
    emailController = TextEditingController(text: 'theavann@gmail.com');
  }

  @override
  void onClose() {
    // Dispose controllers
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  // Toggle the edit state
  void toggleEdit() {
    isEditing.value = !isEditing.value;
    if (isEditing.value == false) {
      // If "Save" was pressed, you would save data here
      // For now, it just toggles back to read-only
      Get.snackbar(
        'រក្សាទុក', // "Saved"
        'ព័ត៌មាន​របស់​អ្នក​ត្រូវ​បាន​ធ្វើ​បច្ចុប្បន្នភាព', // "Your information has been updated"
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
