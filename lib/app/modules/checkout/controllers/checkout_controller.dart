import 'dart:io';

import 'package:e_commerce_app/app/modules/cart/views/cart_view.dart';
import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:e_commerce_app/app/widgets/custom_confirmdialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CheckoutController extends GetxController {
// Reactive variable to hold the selected payment option
  final couponTextController = TextEditingController();
  final uploadedImage = Rx<File?>(null);

  // --- This is the new method to pick an image ---
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image from the gallery
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        uploadedImage.value = File(image.path);
      } else {
        // Optional: Show a message if no image was selected
        // Get.snackbar('Error', 'No image selected.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void applyCoupon() {
    String couponCode = couponTextController.text;
    if (couponCode.isNotEmpty) {
      print("Applying coupon: $couponCode");
      // ... your logic to apply the coupon
    } else {
      Get.snackbar("Error", "Please enter a coupon code");
    }
  }

  var selectedPaymentMethod = 'phum_num_bank'.obs; // Set default

  void selectPaymentMethod(String value) {
    selectedPaymentMethod.value = value;
  }

  void placeOrder() {
    // Implement your order placement logic here
    // e.g., call API, show loading spinner
    // showLoginRequiredDialog();
    Get.toNamed(Routes.ORDER_SUCCESS);
    // Get.snackbar(
    //   'Placing Order',
    //   'Using payment method: ${selectedPaymentMethod.value}',
    //   snackPosition: SnackPosition.BOTTOM,
    // );

    // On success, navigate to a "success" screen or back to dashboard
    // Get.offAllNamed(Routes.ORDER_SUCCESS);
  }

  void showLoginRequiredDialog() {
    Get.dialog(
      CustomConfirmDialog(
        // Title: "Please Log In"
        title: "សូមចូលគណនី",
        // Message: "Please log in before you can order"
        message: "សូមចូលគណនីមុនពេលអ្នកអាចបញ្ជាទិញបាន",
        // Cancel Text: "Cancel"
        cancelText: "បដិសេធ",
        // Confirm Text: "Log In"
        confirmText: "ចូលគណនី",
        onConfirm: () {
          // 1. Close the dialog
          Get.back();
          // 2. Go to the login page
          Get.toNamed(Routes.SIGNIN);
        },
      ),
      // This prevents the user from closing the dialog by tapping outside it
      barrierDismissible: false,
    );
  }
}
