import 'package:e_commerce_app/util/images.dart';
import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class HomeController extends GetxController {
  final AuthProvider provider = AuthProvider();

  var user = {}.obs;
  var isLoading = false.obs;

  // Dashboard state

  var categories = [
    {"name": "សម្ល", "icon": Images.catDrink},
    {"name": "បន្លែ", "icon": Images.catDrink},
    {"name": "សាច់", "icon": Images.catDrink},
    {"name": "ភេសជ្ជៈ", "icon": Images.catDrink},
    {"name": "ភេសជ្ជៈ", "icon": Images.catDrink},
    {"name": "ភេសជ្ជៈ", "icon": Images.catDrink},
    {"name": "ភេសជ្ជៈ", "icon": Images.catDrink},
    {"name": "ភេសជ្ជៈ", "icon": Images.catDrink},
  ].obs;

  var specials = [
    {"name": "Special Dish 1", "image": Images.catDrink},
    {"name": "Special Dish 2", "image": Images.catDrink},
    {"name": "Special Dish 3", "image": Images.catDrink},
  ].obs;

  var products = [
    {"name": "ទឹកត្រីមួយកែវ", "price": 2.0, "image": Images.catDrink},
    {"name": "សាច់ក្រក", "price": 10.0, "image": Images.catDrink},
    {"name": "កាហ្វេតែខែ", "price": 1.0, "image": Images.catDrink},
  ].obs;

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
