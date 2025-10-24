import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/add_address_controller.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is for the dummy controllers in the TextFields
    // You should replace these with controllers from your AddAddressController
    final _addressController = TextEditingController();
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "បន្ថែមអាសយដ្ឋាន".tr, // "Add Address"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 1. Scrollable Content (Map + Form)
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMapView(),
                SizedBox(height: 24),
                _buildAddressTypeSection(),
                SizedBox(height: 24),
                _buildCustomTextFormField(
                  label: "អាសយដ្ឋាន".tr,
                  hint: "Street 336 Toul Kork, Phnom Penh",
                  controller: _addressController,
                ),
                SizedBox(height: 16),
                _buildCustomTextFormField(
                  label: "ឈ្មោះទំនាក់ទំនង".tr,
                  hint: "Theavann",
                  controller: _nameController,
                ),
                SizedBox(height: 16),
                _buildCustomTextFormField(
                  label: "លេខទំនាក់ទំនង".tr,
                  hint: "+855 123 456 78",
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                // Add space at the bottom so it doesn't get hidden by the button
                SizedBox(height: 120),
              ],
            ),
          ),

          // 2. Fixed "Add Address" Button at the bottom
          _buildBottomButton(),
        ],
      ),
    );
  }

  /// Helper for the Google Map view with a pin
  Widget _buildMapView() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            // child: GoogleMap(
            //   initialCameraPosition: CameraPosition(
            //     target: LatLng(11.5721, 104.9142), // Centered on Toul Kork
            //     zoom: 15,
            //   ),
            //   myLocationButtonEnabled: false,
            //   zoomControlsEnabled: false,
            //   // Uncomment this if you want to update the controller as the map moves
            //   // onCameraMove: (position) {
            //   //   controller.updatePinPosition(position.target);
            //   // },
            // ),
          ),
          // The centered red pin
          Center(
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }

  /// Helper for the "Home", "Work", "Other" buttons
  Widget _buildAddressTypeSection() {
    // You should move this to your AddAddressController:
    // final selectedType = "ផ្ទះ".obs;
    final selectedType = "ផ្ទះ".obs; // Using a local Rx for example

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ប្រភេទ".tr, // "Type"
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Obx(
          () => Row(
            children: [
              _buildTypeButton("ផ្ទះ".tr, selectedType), // "Home"
              SizedBox(width: 10),
              _buildTypeButton("កន្លែងធ្វើការ".tr, selectedType), // "Work"
              SizedBox(width: 10),
              _buildTypeButton("ផ្សេងទៀត".tr, selectedType), // "Other"
            ],
          ),
        ),
      ],
    );
  }

  /// Helper for a single type button (Home, Work, Other)
  Widget _buildTypeButton(String title, RxString selectedType) {
    bool isSelected = (selectedType.value == title);
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          selectedType.value = title; // Update the selected type
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Color(0xFF6A932D) : Color(0xFFF0F0F0),
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  /// Helper for the custom styled TextFields
  Widget _buildCustomTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7), // Very light grey background
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none, // No underline
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ),
      ],
    );
  }

  /// Helper for the floating "Add Address" button at the bottom
  Widget _buildBottomButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        // Add a white background to hide content scrolling under it
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, Get.mediaQuery.padding.bottom + 16 // For safe area
            ),
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
            // Call your controller's save method
            // controller.saveAddress();
            Get.back(); // Go back after saving
          },
          child: Text(
            "បន្ថែមអាសយដ្ឋាន".tr, // "Add Address"
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
