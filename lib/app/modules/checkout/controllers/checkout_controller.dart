import 'package:get/get.dart';

class CheckoutController extends GetxController {
// Reactive variable to hold the selected payment option
  var selectedPaymentMethod = 'phum_num_bank'.obs; // Set default

  void selectPaymentMethod(String value) {
    selectedPaymentMethod.value = value;
  }

  void placeOrder() {
    // Implement your order placement logic here
    // e.g., call API, show loading spinner
    Get.snackbar(
      'Placing Order',
      'Using payment method: ${selectedPaymentMethod.value}',
      snackPosition: SnackPosition.BOTTOM,
    );

    // On success, navigate to a "success" screen or back to dashboard
    // Get.offAllNamed(Routes.ORDER_SUCCESS);
  }
}
