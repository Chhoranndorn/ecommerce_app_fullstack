import 'package:e_commerce_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_commerce_app/app/modules/favorite/views/favorite_view.dart';
import 'package:e_commerce_app/app/modules/home/controllers/home_controller.dart';
import 'package:e_commerce_app/app/modules/order_history/views/order_history_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

// import your pages
import '../../home/views/home_view.dart';
import '../../categories/views/categories_view.dart';
import '../../cart/views/cart_view.dart';
import '../../profile/views/profile_view.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});

  final List<Widget> pages = [
    HomeView(),
    const CategoriesView(),
    const FavoriteView(),
    const OrderHistoryView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    // ensure HomeController is available
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CartController());
    return Obx(() {
      return Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "ទំព័រដើម"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "ប្រភេទ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "ចូលចិត្ត"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "ប្រវត្ដិបញ្ជាទិញ"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "គណនី"),
          ],
        ),
      );
    });
  }
}
