import 'package:e_commerce_app/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // Adds a subtle shadow line
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'settings_title'.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero, // Remove top padding
        children: [
          // --- ACCOUNT SETTINGS SECTION ---
          _buildSectionHeader('settings_account'.tr),
          _buildSettingsTile(
            title: 'settings_notifications'.tr,
            onTap: controller.goToNotifications,
          ),
          _buildSettingsTile(
            title: 'settings_language'.tr,
            onTap: controller.goToLanguage,
          ),

          // --- OTHER SETTINGS SECTION ---
          _buildSectionHeader('settings_other'.tr),
          _buildSettingsTile(
            title: 'settings_policy'.tr,
            onTap: controller.goToPolicy,
          ),
          _buildSettingsTile(
            title: 'settings_contact'.tr,
            onTap: controller.goToContact,
          ),
        ],
      ),
    );
  }

  // Helper for the grey section headers
  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: double.infinity,
      color: Color(0xFFEFEFF4), // A light grey color for the header
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[700], // Dark grey text
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  // Helper for the tappable list tiles
  Widget _buildSettingsTile(
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: Colors.grey[400],
      ),
      onTap: onTap,
      tileColor: Colors.white, // White background for the tile
    );
  }
}
