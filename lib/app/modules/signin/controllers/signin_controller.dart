import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  @override
  void onInit() {
    super.onInit();
    // phoneNumberController = TextEditingController();
  }

  @override
  void onClose() {
    // phoneNumberController.dispose();
    super.onClose();
  }

  void performLogin() {
    // Implement your phone number login logic here
    // e.g., validate input, call API
    Get.snackbar(
      'Login Attempt',
      'Attempting login with phone number...',
      snackPosition: SnackPosition.BOTTOM,
    );
    // On successful login, navigate to home
    Get.offAllNamed(Routes.OTP); // Use offAll to clear navigation stack
  }

  void loginWithGoogle() {
    // Implement Google login logic
    Get.snackbar(
      'Google Login',
      'Attempting login with Google...',
      snackPosition: SnackPosition.BOTTOM,
    );
    // On successful login, navigate to home
    // Get.offAllNamed(Routes.HOME);
  }

  void loginWithApple() {
    // Implement Apple ID login logic
    Get.snackbar(
      'Apple Login',
      'Attempting login with Apple ID...',
      snackPosition: SnackPosition.BOTTOM,
    );
    // On successful login, navigate to home
    // Get.offAllNamed(Routes.HOME);
  }

  void goToRegister() {
    // Implement navigation to your registration screen
    Get.snackbar(
      'Register',
      'Navigating to registration screen...',
      snackPosition: SnackPosition.BOTTOM,
    );
    // Example: Get.toNamed(Routes.REGISTER); // Assuming you have a register route
  }
}
