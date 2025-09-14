import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
 var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void signup() {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
    } else if (password.value != confirmPassword.value) {
      Get.snackbar("Error", "Passwords do not match");
    } else {
      // TODO: Call API or Firebase signup
      Get.snackbar("Success", "Account created for $email");
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
