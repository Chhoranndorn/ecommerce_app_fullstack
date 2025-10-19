import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  void goToNotifications() {
    // You would create a Routes.NOTIFICATIONS for this
    Get.snackbar('Navigate', 'Go to Notifications screen');
  }

  void goToLanguage() {
    // This route already exists!
    Get.toNamed(Routes.LANGUAGE);
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
