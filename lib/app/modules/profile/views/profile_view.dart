import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the green color from your app
    final Color primaryGreen = const Color(0xFF6A994E);

    return Scaffold(
      // Set background to white as seen below the icon grid
      backgroundColor: Colors.white,

      // Use SingleChildScrollView to allow all content to scroll
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header Section (Green bg, Profile, White Card)
            _buildHeader(context, primaryGreen),

            // 2. Icon Grid Section (Favorite, Cart, History)
            _buildIconGrid(primaryGreen),

            // 3. Menu List Section
            _buildMenuList(),
          ],
        ),
      ),
    );
  }

  /// Builds the top part of the screen
  Widget _buildHeader(BuildContext context, Color primaryGreen) {
    return Stack(
      clipBehavior: Clip.none, // Allow white card to overflow
      alignment: Alignment.center,
      children: [
        // Green Background
        Container(
          width: double.infinity,
          height: 220, // Adjust height as needed
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
          top: 60, // Adjust for status bar
          left: 16,
          right: 16,
          child: Row(
            children: [
              // Avatar
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
              const SizedBox(width: 12),
              // Name and Email
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
                    'Theavann@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Edit Icon
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                icon: const Icon(Icons.edit_outlined,
                    color: Colors.white, size: 28),
              ),
            ],
          ),
        ),

        // White Balance Card
        Positioned(
          top: 150, // Position it to overlap the green bg
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Top part of the card with transaction button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ចំនួនទឹកប្រាក់ក្នុងកាបូប', // "Amount in wallet"
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // "Transaction" Button
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'ប្រតិបត្តិការ', // "Transaction"
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 12, color: Colors.grey[700]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Bottom part with Wallet and Coin
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Wallet
                    const Column(
                      children: [
                        Text('កាបូប',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        SizedBox(height: 8),
                        Text('1,000 \$',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    // Divider
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey[300],
                    ),
                    // Coin
                    const Column(
                      children: [
                        Text('កាក់',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        SizedBox(height: 8),
                        Text('0 🪙',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                )
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
      // Top padding to account for the overlapping white card
      padding: const EdgeInsets.only(
          top: 100.0, left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildGridItem(
              primaryGreen, Icons.favorite, 'បញ្ជីចូលចិត្ត', 'Favorite'),
          _buildGridItem(primaryGreen, Icons.shopping_cart, 'កន្ត្រក', 'Cart'),
          _buildGridItem(primaryGreen, Icons.history, 'ប្រវត្តិ', 'History'),
        ],
      ),
    );
  }

  /// Helper for each item in the 3-icon grid
  Widget _buildGridItem(Color color, IconData icon, String text, String route) {
    return GestureDetector(
      onTap: () {
        // You can use Get.toNamed('/favorite') etc. here
        print('Navigate to $route');
      },
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
              icon: Icons.calendar_today_outlined,
              text: 'ការ​ណាត់​របស់​ខ្ញុំ'), // My Appointment
          _buildMenuItem(
              icon: Icons.card_giftcard, text: 'ប្រម៉ូសិន'), // Promotion
          _buildMenuItem(
              icon: Icons.notifications_none,
              text: 'ការជូនដំណឹង'), // Notification
          _buildMenuItem(
              icon: Icons.settings_outlined, text: 'ការកំណត់'), // Setting
          _buildMenuItem(
              icon: Icons.person_add_alt_outlined,
              text: 'ណែនាំ​មិត្តភ័ក្ដិ'), // Refer Friend
          _buildMenuItem(
              icon: Icons.shopping_bag_outlined,
              text: 'ការបញ្ជាទិញរបស់ខ្ញុំ'), // My Order
          _buildMenuItem(
              icon: Icons.favorite_border,
              text: 'បញ្ជីចូលចិត្តរបស់ខ្ញុំ'), // My Favorite
          _buildMenuItem(
              icon: Icons.share_outlined,
              text: 'អញ្ជើញមិត្តភក្តិ'), // Invite Friend
          _buildMenuItem(
              icon: Icons.info_outline, text: 'អំពី​ពួក​យើង'), // About Us
          _buildMenuItem(
              icon: Icons.g_translate_outlined,
              text: 'ជ្រើសរើស​ភាសា'), // Choose Language
          const Divider(height: 20),
          _buildMenuItem(
              icon: Icons.delete_outline,
              text: 'លុប​គណនី', // Delete Account
              color: Colors.red),
          _buildMenuItem(
              icon: Icons.logout,
              text: 'ចាកចេញ', // Logout
              color: Colors.red),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Helper for each menu item row
  Widget _buildMenuItem(
      {required IconData icon,
      required String text,
      Color color = Colors.black}) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
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
