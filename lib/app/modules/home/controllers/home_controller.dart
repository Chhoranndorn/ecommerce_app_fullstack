import 'package:e_commerce_app/app/data/providers/models/category.dart';
import 'package:e_commerce_app/app/data/providers/models/product.dart';
import 'package:e_commerce_app/app/data/providers/models/special.dart';
import 'package:e_commerce_app/app/data/providers/services/home_service.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class HomeController extends GetxController {
  final AuthProvider provider = AuthProvider();
  final HomeService _service = HomeService();

  var user = {}.obs;
  var isLoading = true.obs;
  var errorMessage = "".obs;
  // var specials = <Special>[].obs;
  // var categories = <Category>[].obs;
  // var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading.value = true;
      final data = await _service.fetchHomeData();
      // specials.assignAll(data["specials"] as List<Special>);
      // categories.assignAll(data["categories"] as List<Category>);
      // products.assignAll(data["products"] as List<Product>);
      errorMessage.value = "";
    } catch (e) {
      errorMessage.value = "Failed to load data";
    } finally {
      isLoading.value = false;
    }
  }

  // Dashboard state

  // Food carousel (horizontal scroll in green section)
  var foodCarousel = [
    {"image": Images.catDrink},
    {"image": Images.catDrink},
    {"image": Images.catDrink},
    {"image": Images.catDrink},
  ].obs;

  // Banner carousel images
  var imageUrls = [
    {"image": Images.catDrink},
    {"image": Images.catDrink},
    {"image": Images.catDrink},
  ].obs;

  // Special items grid (4x2 with circular images and badges)
  var specialItems = [
    {"name": "ទឹកត្រូក", "image": Images.catDrink, "isSpecial": true},
    {"name": "សាច់ក្រក", "image": Images.catDrink, "isSpecial": true},
    {"name": "ទឹក", "image": Images.catDrink, "isSpecial": false},
    {"name": "កែសៅខ្មៅ", "image": Images.catDrink, "isSpecial": false},
    {"name": "បៃតង", "image": Images.catDrink, "isSpecial": true},
    {"name": "សុ", "image": Images.catDrink, "isSpecial": true},
    {"name": "មុខ", "image": Images.catDrink, "isSpecial": false},
    {"name": "ប្រជុំ", "image": Images.catDrink, "isSpecial": false},
  ].obs;

  // Featured large image
  var featuredImage = {"image": Images.catDrink}.obs;

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
    {"name": "Special Dish 3", "image": Images.catDrink},
    {"name": "Special Dish 3", "image": Images.catDrink},
  ].obs;

  var products = [
    {"name": "ទឹកត្រីមួយកែវ ត្រី", "price": 2.0, "image": Images.catDrink},
    {"name": "សាច់ក្រកបន្លែ", "price": 10.0, "image": Images.catDrink},
    {"name": "កាហ្វេតែខែតែខណ", "price": 1.0, "image": Images.catDrink},
    {"name": "ទឹកក្រូចមួយកែវ", "price": 3.0, "image": Images.catDrink},
    {"name": "សម្លម្ជូរ", "price": 2.0, "image": Images.catDrink},
    {"name": "សមុយ", "price": 3.0, "image": Images.catDrink},
  ].obs;

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
