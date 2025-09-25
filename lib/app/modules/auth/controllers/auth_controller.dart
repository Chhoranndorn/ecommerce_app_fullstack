import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/providers/auth_provider.dart';

class AuthController extends GetxController {
  final AuthProvider provider = AuthProvider();

  var isLoading = false.obs;
  var user = {}.obs;
  var token = "".obs;

  Future<void> register(String name, String email, String password) async {
    try {
      isLoading.value = true;
      final response = await provider.register(name, email, password);
      user.value = response.data["user"];
      token.value = response.data["token"];
      Get.snackbar("Success", "Registered successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await provider.login(email, password);
      user.value = response.data["user"];
      token.value = response.data["token"];
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await provider.logout();
      user.value = {};
      token.value = "";
      Get.snackbar("Success", "Logged out successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getProfile() async {
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
}
