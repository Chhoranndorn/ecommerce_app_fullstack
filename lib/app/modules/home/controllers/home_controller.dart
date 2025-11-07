import 'package:e_commerce_app/app/data/providers/models/banner.dart';
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

  // API Data observables
  var banners = <Banner>[].obs;
  var specials = <Special>[].obs;
  var categories = <Category>[].obs;
  var featuredProducts = <Product>[].obs;
  var products = <Product>[].obs;

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

      // Assign API data to observables
      banners.assignAll(data["banners"] as List<Banner>);
      specials.assignAll(data["specials"] as List<Special>);
      categories.assignAll(data["categories"] as List<Category>);
      featuredProducts.assignAll(data["featured_products"] as List<Product>);
      products.assignAll(data["products"] as List<Product>);

      // Convert data to UI-compatible format

      // Banners to imageUrls for carousel
      categoriesUrls.assignAll(
          categories.map((categories) => {"icon": categories.icon}).toList());
      imageUrls
          .assignAll(banners.map((banner) => {"image": banner.image}).toList());
      // print("kkkkk:$imageUrls");
      print("kkkkk:$categoriesUrls");

      // Featured products to foodCarousel
      foodCarousel.assignAll(featuredProducts
          .take(4)
          .map((product) => {"image": product.image})
          .toList());

      // Specials to specialItems grid
      specialItems.assignAll(specials
          .map((special) =>
              {"name": special.name, "image": special.image, "isSpecial": true})
          .toList());

      errorMessage.value = "";
    } catch (e) {
      errorMessage.value = "Failed to load data: ${e.toString()}";
      print("Error fetching home data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Dashboard state - converted from API data for UI compatibility

  // Food carousel (horizontal scroll in green section) - uses featured products
  var foodCarousel = <Map<String, dynamic>>[].obs;

  // Banner carousel images
  var imageUrls = <Map<String, dynamic>>[].obs;
  var categoriesUrls = <Map<String, dynamic>>[].obs;

  // Special items grid (4x2 with circular images and badges)
  var specialItems = <Map<String, dynamic>>[].obs;

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
