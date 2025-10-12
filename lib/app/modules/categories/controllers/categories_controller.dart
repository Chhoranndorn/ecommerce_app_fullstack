import 'package:e_commerce_app/util/images.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final count = 0.obs;
  var categoryList = [].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
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
}
