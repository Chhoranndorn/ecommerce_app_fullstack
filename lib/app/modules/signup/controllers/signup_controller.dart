import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class SignupController extends GetxController {
  final AuthProvider provider = AuthProvider();
  var isLoading = false.obs;

  Future<void> register(String name, String email, String password) async {
    try {
      isLoading.value = true;
      final response = await provider.register(name, email, password);
      Get.snackbar("Success", "Account created for ${response.data['user']['name']}");
      // Go to login after register
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
