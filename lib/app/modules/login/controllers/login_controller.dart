import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class LoginController extends GetxController {
  final AuthProvider provider = AuthProvider();

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      print("here");
      isLoading.value = true;
      final response = await provider.login(email, password);
      Get.snackbar("Success", "Welcome ${response.data['user']['name']}");
      // navigate to home after login
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
