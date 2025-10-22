import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAddressDialog extends StatelessWidget {
  // --- STATE ---
  // We use a local reactive variable to track the selection.
  // You can replace this with a variable from your GetX controller.
  final selectedIndex = 0.obs;

  // Mock data for the address list. Replace this with your controller's data.
  final List<String> addresses = [
    "Street 336 Phnom Penh, 17252",
    "Street 105, Toul Sangke, Phnom Penh",
  ];

  SelectAddressDialog({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1. Title
          Text(
            "អាសយដ្ឋាន".tr, // "Addresses"
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),

          // 2. Address List
          // Use Obx to rebuild the list when selectedIndex changes
          Obx(
            () => Column(
              children: List.generate(
                addresses.length,
                (index) => _buildAddressListItem(
                  addresses[index],
                  index,
                  selectedIndex.value,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24.0),

          // 3. Buttons
          Row(
            children: [
              // "Add New Address" Button
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF6A932D), // Green
                    side: BorderSide(color: Color(0xFF6A932D), width: 1.5),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // 1. Close this dialog
                    Get.toNamed(Routes.ADD_ADDRESS);
                    // Get.back();
                    // 2. Navigate to your "Add Address" page
                    // Get.toNamed(Routes.ADD_ADDRESS);
                  },
                  child: Text(
                    "បន្ថែមអាសយដ្ឋានថ្មី".tr, // "Add New Address"
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // "Choose This Address" Button
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A932D), // Green
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // 1. Use the selected address
                    // e.g., controller.setSelectedAddress(addresses[selectedIndex.value]);
                    // 2. Close the dialog
                    Get.back();
                  },
                  child: Text(
                    "ជ្រើសរើសអាសយដ្ឋាន".tr, // "Choose This Address"
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper widget to build each selectable address row
  Widget _buildAddressListItem(String address, int index, int selectedIndex) {
    bool isSelected = (index == selectedIndex);

    return GestureDetector(
      onTap: () {
        // Update the selected index
        this.selectedIndex.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.description_outlined, // Placeholder for the 'ទ' icon
              color: Colors.grey[600],
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                address,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked_outlined,
              color: Color(0xFF6A932D), // Green
            ),
          ],
        ),
      ),
    );
  }
}
