import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/drawer_controller.dart';

class DrawerView extends GetView<AppDrawerController> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    const drawerColor = Color(0xFF6B9F2E);

    return Drawer(
      child: Container(
        color: drawerColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: drawerColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: drawerColor,
                    backgroundImage: const AssetImage(Images.logo),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Phum Num Banh Chok",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            _buildMenuItem(Icons.home, "ទំព័រដើម", () {
              Get.back();
              controller.selectMenu("home");
              Get.toNamed('/dashboard');
            }),
            _buildMenuItem(Icons.shopping_cart, "ប្រព័ន្ធបញ្ជាទិញ", () {
              Get.back();
              Get.toNamed(Routes.CATEGORIES);
            }),
            _buildMenuItem(Icons.confirmation_number, "កាប៉ូប", () {
              Get.toNamed(Routes.WALLET);
            }),
            _buildMenuItem(Icons.card_giftcard, "ប្រវត្តិ", () {
              Get.toNamed(Routes.PROMOTION);
            }),
            _buildMenuItem(Icons.notifications, "កាន់ទុកនិក្យ៉ា", () {
              Get.toNamed(Routes.NOTIFICATION);
            }),
            _buildMenuItem(Icons.settings, "កាកិត្តការី", () {
              Get.toNamed(Routes.SETTING);
            }),
            _buildMenuItem(Icons.info, "អំពីកុលើញ", () {
              Get.toNamed(Routes.ABOUTUS);
            }),
            _buildMenuItem(Icons.person_remove, "លុបគណនី", () {
              // Delete account functionality
            }),
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
