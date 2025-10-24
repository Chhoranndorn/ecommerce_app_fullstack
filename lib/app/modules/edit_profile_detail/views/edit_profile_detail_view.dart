import 'package:e_commerce_app/app/modules/edit_profile_detail/controllers/edit_profile_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileDetailView extends GetView<EditProfileDetailController> {
  const EditProfileDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('កែប្រែប្រវត្តិរូប'), // "Edit Profile"
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Text(
                'ព័ត៌មានទំនាក់ទំនង', // "Contact Information"
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),

              // Form Fields
              _buildTextField(
                controller: controller.nameController,
                labelText: 'ឈ្មោះ', // "Name"
              ),
              _buildTextField(
                controller: controller.emailController,
                labelText: 'អ៊ីមែល', // "Email"
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                controller: controller.phoneController,
                labelText: 'លេខទូរស័ព្ទ', // "Phone Number"
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                controller: controller.whatsappController,
                labelText: 'គណនី WhatsApp', // "WhatsApp Account"
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                controller: controller.telegramController,
                labelText: 'តេលេក្រាម', // "Telegram"
              ),
              _buildTextField(
                controller: controller.wechatController,
                labelText: 'គណនី Wechat', // "Wechat Account"
              ),
              _buildTextField(
                controller: controller.addressController,
                labelText: 'អាស័យដ្ឋាន', // "Address"
                maxLines: 3,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // Submit Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: controller.submitProfile,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A994E), // Green color from image
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'យល់ព្រម', // "Agree" / "Submit"
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to avoid repeating code
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
