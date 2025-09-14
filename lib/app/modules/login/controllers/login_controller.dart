import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void login() {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      // TODO: Call API or Firebase login
      Get.snackbar("Success", "Logged in as $email");
      Get.offAllNamed(Routes.HOME);

    }
  }
}
