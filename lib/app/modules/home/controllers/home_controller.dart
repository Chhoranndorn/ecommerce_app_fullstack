import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class HomeController extends GetxController {
  final AuthProvider provider = AuthProvider();

  var user = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      final response = await provider.profile();
      user.value = response.data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await provider.logout();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
