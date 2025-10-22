import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDeliveryTypeDialog extends StatelessWidget {
  // --- STATE ---
  // We use a local RxString to track the selection.
  // You can replace this with a variable from your GetX controller.
  final RxString selectedType;

  // Pass the initial value to the dialog
  SelectDeliveryTypeDialog({Key? key, String? initialType})
      : selectedType =
            (initialType ?? "ការដឹកជញ្ជូន").obs, // Default to "Delivery"
        super(key: key);

  final String deliveryOption = "ការដឹកជញ្ជូន"; // "Delivery"
  final String pickupOption = "ទៅយកផ្ទាល់"; // "Pick up"

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
            "សូមជ្រើសរើសប្រភេទដឹកជញ្ជូន".tr, // "Please select delivery type"
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24.0),

          // 2. Options
          // Use Obx to rebuild when the selection changes
          Obx(
            () => _buildDeliveryOption(
              title: deliveryOption.tr,
              isSelected: selectedType.value == deliveryOption,
              onTap: () {
                selectedType.value = deliveryOption;
              },
            ),
          ),
          const SizedBox(height: 12.0),
          Obx(
            () => _buildDeliveryOption(
              title: pickupOption.tr,
              isSelected: selectedType.value == pickupOption,
              onTap: () {
                selectedType.value = pickupOption;
              },
            ),
          ),

          const SizedBox(height: 24.0),

          // 3. "Select" Button
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
                // 1. Pass the selected value back to the controller
                // e.g., controller.setDeliveryType(selectedType.value);
                // 2. Close the dialog
                Get.back(
                    result: selectedType
                        .value); // You can optionally return the value
              },
              child: Text(
                "ជ្រើសរើស".tr, // "Select"
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

  /// Helper widget to build each selectable option
  Widget _buildDeliveryOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFF6A932D), // Green background
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
