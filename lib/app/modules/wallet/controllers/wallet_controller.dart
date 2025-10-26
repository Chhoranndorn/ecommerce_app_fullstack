import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  var isBalanceVisible = true.obs;
  var selectedPaymentMethod = 'wallet'.obs; // 'wallet' or 'bank'

  void toggleBalanceVisibility() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void sendMoney() {
    // Navigate to a "Send Money" screen
    Get.snackbar('Navigate', 'Go to Send Money screen');
  }

  void addMoney() {
    // Navigate to an "Add Money" screen
    Get.snackbar('Navigate', 'Go to Add Money screen');
  }

  void goToHome() {
    // Navigate to Dashboard/Home and remove other screens
    Get.offAllNamed(Routes.DASHBOARD);
  }
}
