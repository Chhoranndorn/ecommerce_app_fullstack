import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  // 1. Selected Emotion
  // 0-4 corresponding to the icons, 2 (Neutral) is a good default.
  var selectedEmotionIndex = 2.obs;

  // 2. Comment
  late TextEditingController commentController;

  // 3. Checkboxes
  var checkbox1 = true.obs; // This one is checked by default in the image
  var checkbox2 = false.obs;

  @override
  void onInit() {
    super.onInit();
    commentController = TextEditingController();
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }

  // Method to update emotion
  void selectEmotion(int index) {
    selectedEmotionIndex.value = index;
  }

  // Methods for checkboxes
  void toggleCheckbox1(bool? value) {
    checkbox1.value = value ?? false;
  }

  void toggleCheckbox2(bool? value) {
    checkbox2.value = value ?? false;
  }

  // Submit logic
  void submitFeedback() {
    // Add your submission logic here
    Get.snackbar(
      'បានបញ្ជូន', // Submitted
      'អរគុណសម្រាប់ការផ្តល់មតិកែលម្អ!', // Thank you for your feedback!
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.back();
  }

  // Cancel logic
  void cancel() {
    Get.back();
  }
}
