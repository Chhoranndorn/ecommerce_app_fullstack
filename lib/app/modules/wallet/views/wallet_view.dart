import 'package:e_commerce_app/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'កាបូប', // Wallet
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'ទំនាក់ទំនងជួយ', // Help/Support
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFF84C341)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Balance Section
              _buildSectionHeader('ថ្លៃទំនិញសរុប'), // Total amount
              const SizedBox(height: 8),
              const Text(
                '0 \$',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const Divider(height: 30),

              // Payment Method Section
              _buildSectionHeader('ការបង់ប្រាក់'), // Payment
              const SizedBox(height: 12),
              _buildMyWalletCard(),
              const SizedBox(height: 20),

              // Bank Payment Section
              _buildSectionHeader('ការទូទាត់តាមធនាគារ'), // Bank payment
              const SizedBox(height: 12),
              _buildBankPaymentCard(),

              const SizedBox(height: 120),
            ],
          ),

          // Bottom Button
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF84C341),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 2,
              ),
              onPressed: () {
                // Order now action
              },
              child: const Text(
                'បញ្ជាញឥឡូវ', // Order now
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.home_outlined, color: Colors.black),
              onPressed: () => Get.back(),
            ),
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

  Widget _buildMyWalletCard() {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectPaymentMethod('wallet'),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: controller.selectedPaymentMethod.value == 'wallet'
                  ? Border.all(color: const Color(0xFF84C341), width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF84C341),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'គណនី Phum Num Banh Chok',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ទំនាក់ទំនងអ្នកក្រុមហ៊ុនដើម្បីបង្កើនប្រាក់របស់អ្នក',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  controller.selectedPaymentMethod.value == 'wallet'
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: controller.selectedPaymentMethod.value == 'wallet'
                      ? const Color(0xFF84C341)
                      : Colors.grey,
                  size: 24,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildBankPaymentCard() {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectPaymentMethod('bank'),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: controller.selectedPaymentMethod.value == 'bank'
                  ? Border.all(color: const Color(0xFF84C341), width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF003D6F), // ABA blue
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 8,
                        left: 8,
                        right: 8,
                        child: Text(
                          'ABA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Text(
                            'KHQR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ABA KHQR',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Scan to pay with any banking app',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
