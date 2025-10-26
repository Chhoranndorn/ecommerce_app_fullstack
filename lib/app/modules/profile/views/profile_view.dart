import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryGreen = const Color(0xFF84C341);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context, primaryGreen),
            _buildIconGrid(primaryGreen),
            _buildMenuList(),
          ],
        ),
      ),
    );
  }

  /// Builds the top part of the screen
  Widget _buildHeader(BuildContext context, Color primaryGreen) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Green Background
        Container(
          width: double.infinity,
          height: 280,
          decoration: BoxDecoration(
            color: primaryGreen,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),

        // Profile Info (Avatar, Name, Email)
        Positioned(
          top: 50,
          left: 16,
          right: 16,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theavann',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'theavann@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                icon: const Icon(Icons.person_add_alt_outlined,
                    color: Colors.white, size: 28),
              ),
            ],
          ),
        ),

        // Section Title
        const Positioned(
          top: 130,
          left: 16,
          child: Text(
            'ចំនួនទឹកប្រាក់នៅកាបូប',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Balance Card with Green Gradient
        Positioned(
          top: 160,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6B9E3D),
                  const Color(0xFF84C341),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.WALLET_HISTORY);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'ប្រតិបត្តិការ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'កាបូប',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1,000 \$',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    const Column(
                      children: [
                        Text(
                          'ពិន្ទុ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '0 ត',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the 3-icon grid
  Widget _buildIconGrid(Color primaryGreen) {
    return Container(
      padding: const EdgeInsets.only(
          top: 100.0, left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildGridItem(
            primaryGreen,
            Icons.favorite,
            'បញ្ជីរបស់ចូលចិត្ត',
            () => Get.toNamed(Routes.FAVORITE),
          ),
          _buildGridItem(
            primaryGreen,
            Icons.shopping_cart,
            'កន្ត្រក',
            () => Get.toNamed(Routes.CART),
          ),
          _buildGridItem(
            primaryGreen,
            Icons.notifications,
            'ប្រាសិទ្ធិ',
            () => Get.toNamed(Routes.NOTIFICATION),
          ),
        ],
      ),
    );
  }

  /// Helper for each item in the 3-icon grid
  Widget _buildGridItem(
    Color color,
    IconData icon,
    String text,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  /// Builds the long list of menu options
  Widget _buildMenuList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildMenuItem(
              icon: Icons.payment_outlined,
              text: 'wallet',
              onTap: () => Get.toNamed(Routes.WALLET)), // Payment
          _buildMenuItem(
              icon: Icons.history,
              text: 'order_history',
              onTap: () => Get.toNamed(Routes.ORDER_HISTORY)), // History
          _buildMenuItem(
              icon: Icons.verified_user_outlined,
              text: 'notification',
              onTap: () => Get.toNamed(Routes.NOTIFICATION)), // Verification
          _buildMenuItem(
              icon: Icons.settings_outlined,
              text: 'setting',
              onTap: () => Get.toNamed(Routes.SETTING)), // Settings
          _buildMenuItem(
              icon: Icons.people_outline,
              text: 'edit_profile',
              onTap: () => Get.toNamed(Routes.EDIT_PROFILE)), // View statement
          _buildMenuItem(
              icon: Icons.shopping_cart_outlined,
              text: 'order',
              onTap: () => Get.toNamed(Routes.CART)), // Call
          _buildMenuItem(
              icon: Icons.favorite_border,
              text: 'favorite',
              onTap: () => Get.toNamed(Routes.FAVORITE)), // Favorites
          _buildMenuItem(
              icon: Icons.share_outlined,
              text: 'share',
              onTap: () => controller.shareApp()), // Share
          _buildMenuItem(
              icon: Icons.info_outline,
              text: 'about_us',
              onTap: () => Get.toNamed(Routes.ABOUTUS)), // About us
          _buildMenuItem(
              icon: Icons.mic_none,
              text: 'feedback',
              onTap: () => Get.toNamed(Routes.FEEDBACK)), // Feedback
          _buildMenuItem(
              icon: Icons.logout_outlined,
              text: 'delete_account', // Logout
              color: Colors.red),
          _buildMenuItem(
              icon: Icons.exit_to_app,
              text: 'exit', // Exit
              color: Colors.black87),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  /// Helper for each menu item row
  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(fontSize: 16, color: color),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }
}
