import 'package:e_commerce_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'checkout_title'.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildDeliveryAddress(),
          SizedBox(height: 16),
          _buildOrderSummary(),
          SizedBox(height: 16),
          _buildOrderDetails(),
          SizedBox(height: 16),
          _buildPromoCode(),
          SizedBox(height: 16),
          _buildSectionHeader('bank_payment_title'.tr),
          _buildBankPaymentCard(),
          SizedBox(height: 16),
          _buildSectionHeader('payment_method_title'.tr),
          _buildPaymentMethodOptions(),
        ],
      ),
      // --- Bottom "Buy Now" Button ---
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6A932D), // Green
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: controller.placeOrder,
          child: Text(
            'buy_now'.tr,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'delivery_address_title'.tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF6A932D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'change_address'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Street 336, Toul Kork, Phnom Penh.',
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('order_summary_title'.tr),
          _buildSummaryItem('item_1_title', '1', '10.00'),
          _buildSummaryItem('item_2_title', '1', '3.00'),
          _buildSummaryItem('item_3_title', '1', '1.00'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String titleKey, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text('$quantity x', style: TextStyle(color: Colors.grey[700])),
          SizedBox(width: 8),
          Expanded(
            child: Text(titleKey.tr, style: TextStyle(fontSize: 15)),
          ),
          SizedBox(width: 8),
          Text('\$ $price', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('order_details_title'.tr),
          _buildDetailRow('name'.tr, 'Testing'),
          _buildDetailRow('phone'.tr, '012 345 678'),
          Divider(height: 24),
          _buildDetailRow('subtotal'.tr, '\$ 14.00'),
          _buildDetailRow('delivery_fee'.tr, '\$ 1.00'),
          _buildDetailRow('discount'.tr, '-\$ 100.00', isDiscount: true),
          Divider(height: 24),
          _buildDetailRow('total_payment'.tr, '\$ 15.00', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value,
      {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount
                  ? Colors.red
                  : (isTotal ? Color(0xFF6A932D) : Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCode() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer_outlined, color: Colors.grey[600]),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'enter_promo_code'.tr,
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankPaymentCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text('KHQR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ),
        title:
            Text('aba_khqr'.tr, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('scan_to_pay'.tr, style: TextStyle(color: Colors.grey)),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            color: Colors.grey[400], size: 18),
        onTap: () {/* Handle tap */},
      ),
    );
  }

  Widget _buildPaymentMethodOptions() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() => Column(
            children: [
              _buildPaymentRadioTile(
                title: 'use_wallet_balance'.tr,
                subtitle: '',
                value: 'wallet_balance',
                icon: Icons.account_balance_wallet,
                iconColor: Colors.orange,
              ),
              _buildPaymentRadioTile(
                title: 'wallet_name'.tr,
                subtitle: 'wallet_desc'.tr,
                value: 'phum_num_bank',
                icon: Icons.food_bank_outlined,
                iconColor: Color(0xFF6A932D),
              ),
              _buildPaymentRadioTile(
                title: 'aba_bank'.tr,
                subtitle: 'aba_bank_desc'.tr,
                value: 'aba_bank',
                icon: Icons.account_balance,
                iconColor: Colors.blue[900],
              ),
            ],
          )),
    );
  }

  Widget _buildPaymentRadioTile({
    required String title,
    required String subtitle,
    required String value,
    required IconData icon,
    Color? iconColor,
  }) {
    return RadioListTile<String>(
      groupValue: controller.selectedPaymentMethod.value,
      onChanged: (val) => controller.selectPaymentMethod(val!),
      value: value,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle.isEmpty
          ? null
          : Text(subtitle, style: TextStyle(color: Colors.grey)),
      secondary: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: iconColor?.withOpacity(0.1) ?? Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? Colors.grey),
      ),
    );
  }
}
