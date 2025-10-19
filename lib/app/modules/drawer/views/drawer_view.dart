import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/drawer_controller.dart';

class DrawerView extends GetView<AppDrawerController> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage(Images.logo),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Phum Num Banh Chok",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            _buildMenuItem(Icons.home, "home", () {
              Get.back();
              controller.selectMenu("home");
              Get.toNamed('/dashboard');
            }),
            _buildMenuItem(Icons.shopping_cart, "ប្រភេទផលិតផល", () {
              Get.back();
              controller.selectMenu("categories");
              Get.toNamed('/categories');
            }),
            _buildMenuItem(Icons.badge_sharp, "wallet", () {
              Get.toNamed(Routes.WALLET);
            }),
            _buildMenuItem(Icons.card_giftcard, "promotion", () {}),
            _buildMenuItem(Icons.notifications, "ការជូនដំណឹង", () {}),
            _buildMenuItem(Icons.settings, "ការកំណត់", () {
              Get.toNamed(Routes.SETTING);
            }),
            _buildMenuItem(Icons.info, "អំពីកម្មវិធី", () {}),
            _buildMenuItem(Icons.person, "លិខិតអត្តសញ្ញាណ", () {}),
            _buildMenuItem(Icons.logout, "ចាកចេញ", () {
              Get.back();
              Get.offAllNamed('/login');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
