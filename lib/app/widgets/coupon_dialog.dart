import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponDialog extends StatelessWidget {
  // Pass in the controller from your GetX page/controller
  final TextEditingController couponController;

  const CouponDialog({
    Key? key,
    required this.couponController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          // 1. Title
          Text(
            "គូប៉ុង ប្រូម៉ូសិន".tr, // "Coupon Promotion"
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24.0),

          // 2. Coupon Text Field
          TextFormField(
            controller: couponController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "បញ្ចូលលេខកូដ".tr, // "Enter code"
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF6A932D), width: 1.5),
              ),
            ),
          ),

          const SizedBox(height: 24.0),

          // 3. "Agree" Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A932D), // Green
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // 1. You can now access the code via couponController.text
                // e.g., controller.applyCoupon(couponController.text);

                // 2. Close the dialog
                Get.back();
              },
              child: Text(
                "យល់ព្រម".tr, // "Agree/OK"
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
