import 'package:e_commerce_app/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This provides the light grey background
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'wallet_title'.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 18,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.send_rounded, color: Colors.white, size: 18),
                onPressed: controller.sendMoney,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              // --- Balance Section ---
              _buildSectionHeader('balance_amount'.tr),
              Obx(() => Text(
                    controller.isBalanceVisible.value ? '0 \$' : '• • • \$',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              Divider(height: 30),

              // --- My Wallet Section ---
              _buildSectionHeader('my_wallet'.tr),
              SizedBox(height: 8),
              _buildMyWalletCard(),
              SizedBox(height: 20),

              // --- Bank Payment Section ---
              _buildSectionHeader('bank_payment'.tr),
              SizedBox(height: 8),
              _buildBankPaymentCard(),

              // Add padding to the bottom so it doesn't hide behind the button
              SizedBox(height: 120),
            ],
          ),

          // --- Bottom Buttons ---
          _buildBottomButtons(),
        ],
      ),
    );
  }

  // Helper for "Add Money" and "Home" buttons
  Widget _buildBottomButtons() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // "Add Money" Button
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A932D), // Green
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: controller.addMoney,
              child: Text(
                'add_money'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // "Home" Button
          FloatingActionButton(
            onPressed: controller.goToHome,
            child: Icon(Icons.home, color: Color(0xFF6A932D)),
            backgroundColor: Colors.white,
            elevation: 2,
          ),
        ],
      ),
    );
  }

  // Helper for section titles
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Helper for the "My Wallet" card
  Widget _buildMyWalletCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Replace with your logo
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF6A932D), // Green
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.food_bank_outlined,
                color: Colors.white), // Placeholder icon
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'wallet_account_name'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'wallet_account_desc'.tr,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          // Toggle Visibility Button
          Obx(() => IconButton(
                icon: Icon(
                  controller.isBalanceVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
                onPressed: controller.toggleBalanceVisibility,
              )),
        ],
      ),
    );
  }

  // Helper for the "ABA KHQR" card
  Widget _buildBankPaymentCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Replace with ABA logo
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[900], // ABA color
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'KHQR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'aba_khqr'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'scan_to_pay'.tr,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.grey[400], size: 18),
        ],
      ),
    );
  }
}
