import 'package:e_commerce_app/app/modules/aboutus/controllers/aboutus_controller.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsView extends GetView<AboutusController> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          'អំពី​ពួក​យើង', // "About Us"
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 3. Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 4. Banner Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  Images.product1, // Your image path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported,
                          color: Colors.grey[400]),
                    );
                  },
                ),
              ),
            ),

            // 5. "About Us" Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('អំពី​ពួក​យើង'), // "About Us" title
                  const SizedBox(height: 8.0),
                  const Text(
                    'ភូមិ​នំ​បញ្ចុក ជា​ភោជនីយដ្ឋាន​បែប​ប្រពៃណី​ខ្មែរ​យើង​ដែល​មាន​បម្រើ​ជូន​នូវ​ម្ហូប​ពិសេសៗ​ជា​ច្រើន​មុខ ដូច​ជា​នំ​បញ្ចុក​សម្លរ​ខ្មែរ និង​មុខម្ហូប​ជា​ច្រើន​ទៀត។',
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5, // Line height for readability
                    ),
                  ),
                ],
              ),
            ),

            // 6. Divider
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(),
            ),

            // 7. "Contact Us" Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(
                      'ទំនាក់ទំនង​ពួក​យើង'), // "Contact Us" title
                  const SizedBox(height: 8.0),
                  _buildContactInfoRow(
                    label: 'ឈ្មោះ​ផេ​ក',
                    value: 'ភូមិ​នំ​បញ្ចុក Phum Num Banh Chok',
                    highlight: true,
                  ),
                  _buildContactInfoRow(
                    label: 'អ៊ី​ម៉ែ​ល',
                    value: 'phumnumbanhchok@gmail.com',
                    highlight: true,
                  ),
                  _buildContactInfoRow(
                    label: 'ទំនាក់ទំនង',
                    value: '+855 12 487 992',
                    highlight: false, // Phone number is black in the image
                  ),
                  _buildContactInfoRow(
                    label: 'អាសយដ្ឋាន',
                    value:
                        'ភូមិ​នំ​បញ្ចុក Phum Num Banh Chok Siem Reap, Cambodia 171201',
                    highlight: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0), // Padding at the bottom
          ],
        ),
      ),
    );
  }

  /// Helper widget for section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Helper widget for contact info rows
  Widget _buildContactInfoRow({
    required String label,
    required String value,
    bool highlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700], // Dark grey for label
            ),
          ),
          // Value
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                // Use green if highlighted, otherwise black
                color: highlight ? const Color(0xFF6A994E) : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
