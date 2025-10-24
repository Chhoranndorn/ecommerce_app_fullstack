import 'package:e_commerce_app/app/modules/WalletHistory/controllers/wallet_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletHistoryView extends GetView<WalletHistoryController> {
  const WalletHistoryView({Key? key}) : super(key: key);

  // Define the green color
  static const Color primaryGreen = Color(0xFF6A994E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0F8), // Light purple-ish background
      appBar: AppBar(
        title: const Text('ប្រវត្តិនៃកាបូបលុយ'), // Wallet History
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          // 1. Green Summary Box
          _buildSummaryCard(),

          // 2. Tab Bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: controller.tabController,
              indicatorColor: primaryGreen,
              labelColor: primaryGreen,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'កាបូប'), // Wallet
                Tab(text: 'ពិន្ទុ'), // Points
                Tab(text: 'ពិន្ទុដែលបានដក'), // Points Withdrawn
              ],
            ),
          ),

          // 3. Tab Bar View
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                _buildWalletList(),
                _buildPointsTab(),
                _buildWithdrawnList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  // Green summary box
  Widget _buildSummaryCard() {
    return Container(
      color: primaryGreen,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'កាបូប: 1,000 \$', // Wallet: $1,000
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'ពិន្ទុ: 0 ពិន្ទុ', // Points: 0 Points
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Tab 1: Wallet List
  Widget _buildWalletList() {
    return ListView.builder(
      itemCount: controller.walletTransactions.length,
      padding: const EdgeInsets.only(top: 8),
      itemBuilder: (context, index) {
        final tran = controller.walletTransactions[index];
        return _buildTransactionCard(
          title: tran['title']!,
          date: tran['date']!,
          amount: tran['amount']!,
          amountUnit: '\$',
          isPoints: false,
        );
      },
    );
  }

  // Tab 2: Points Tab (List + Button)
  Widget _buildPointsTab() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: controller.pointsTransactions.length,
        padding: const EdgeInsets.only(top: 8),
        itemBuilder: (context, index) {
          final tran = controller.pointsTransactions[index];
          return _buildTransactionCard(
            title: tran['title']!,
            date: tran['date']!,
            amount: tran['amount']!,
            amountUnit: 'ពិន្ទុ',
            isPoints: true,
          );
        },
      ),
      // Button at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: controller.showConvertPointsDialog,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryGreen,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'បម្លែងពិន្ទុទៅក្នុងកាបូបលុយ', // Convert points to wallet
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Tab 3: Withdrawn List
  Widget _buildWithdrawnList() {
    return ListView.builder(
      itemCount: controller.withdrawnTransactions.length,
      padding: const EdgeInsets.only(top: 8),
      itemBuilder: (context, index) {
        final tran = controller.withdrawnTransactions[index];
        return _buildTransactionCard(
          title: tran['title']!,
          date: tran['date']!,
          amount: tran['amount']!,
          amountUnit: 'ពិន្ទុ',
          isPoints: true,
        );
      },
    );
  }

  // Reusable card for each transaction item
  Widget _buildTransactionCard({
    required String title,
    required String date,
    required String amount,
    required String amountUnit,
    bool isPoints = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Title and Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // Right side: Amount
          Text(
            isPoints ? '$amount $amountUnit' : '$amountUnit $amount',
            style: const TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
