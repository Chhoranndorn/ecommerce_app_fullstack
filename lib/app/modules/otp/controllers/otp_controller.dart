import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  late List<TextEditingController> otpTextControllers;

  // Use a reactive list to store the OTP digits entered by the user
  // This will trigger UI updates for the 'Verify' button state (e.g.)
  final RxList<String> otpDigits =
      RxList<String>.filled(6, ''); // 6 digits for OTP

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers for 6 OTP input fields
    otpTextControllers = List.generate(
      otpDigits.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void onClose() {
    // Dispose all TextEditingControllers when the controller is closed
    for (var controller in otpTextControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  // Update the specific OTP digit in our reactive list
  void updateOtpDigit(int index, String value) {
    otpDigits[index] = value;
    // You can also add logic here to automatically verify if all digits are entered
    // if (otpDigits.every((digit) => digit.isNotEmpty)) {
    //   verifyOtp();
    // }
  }

  void verifyOtp() {
    String enteredOtp =
        otpDigits.join(); // Join all digits to form the complete OTP
    if (enteredOtp.length == otpDigits.length) {
      Get.snackbar(
        'Verifying OTP',
        'Entered OTP: $enteredOtp',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Simulate API call for OTP verification
      Future.delayed(Duration(seconds: 2), () {
        if (enteredOtp == "123456") {
          // Replace with actual OTP validation
          Get.snackbar(
            'Success',
            'OTP Verified Successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Navigate to the Home screen and remove all previous routes
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar(
            'Error',
            'Invalid OTP. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          // Clear OTP fields on error
          for (var controller in otpTextControllers) {
            controller.clear();
          }
          otpDigits.assignAll(List.filled(otpDigits.length, ''));
        }
      });
    } else {
      Get.snackbar(
        'Incomplete OTP',
        'Please enter all ${otpDigits.length} digits of the OTP.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void resendOtp() {
    Get.snackbar(
      'Resend OTP',
      'OTP has been resent to your number.',
      snackPosition: SnackPosition.BOTTOM,
    );
    // Implement API call to resend OTP
  }
}
