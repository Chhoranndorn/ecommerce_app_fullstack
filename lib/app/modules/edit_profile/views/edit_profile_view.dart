import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the green color from your app
    final Color primaryGreen = const Color(0xFF6A994E);

    return Scaffold(
      // 1. Light purple background
      backgroundColor: const Color(0xFFF3F0F8),
      
      // 2. AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'កែប្រែប្រវត្តិរូប', // "Edit Profile"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      
      // 3. Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 4. Header Row with Title and Edit Button
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ព័ត៌មានទំនាក់ទំនង', // "Contact Information"
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.toggleEdit();
                    },
                    child: Text(
                      controller.isEditing.value
                          ? 'រក្សាទុក' // "Save"
                          : 'កែប្រែ', // "Edit"
                      style: TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // 5. Form Fields
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Obx(
                () => Column(
                  children: [
                    _buildTextField(
                      controller: controller.nameController,
                      label: 'ឈ្មោះ', // "Name"
                      readOnly: !controller.isEditing.value,
                    ),
                    const SizedBox(height: 8.0),
                    _buildTextField(
                      controller: controller.emailController,
                      label: 'អ៊ីមែល', // "Email"
                      readOnly: !controller.isEditing.value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper widget for the text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool readOnly = true,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        // Style for when the field is not focused
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        // Style for when the field is focused (being edited)
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF6A994E), width: 2.0),
        ),
        // When read-only, remove the underline
        border: readOnly ? InputBorder.none : null, 
      ),
    );
  }
}