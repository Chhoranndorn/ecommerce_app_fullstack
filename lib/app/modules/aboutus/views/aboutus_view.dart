import 'package:e_commerce_app/app/modules/aboutus/controllers/aboutus_controller.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsView extends GetView<AboutusController> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'អំពីពួកយើង',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
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

            // About Us Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('អំពីពួកយើង'),
                  const SizedBox(height: 12.0),
                  const Text(
                    'សូមធុកៗអ្នក ជាក្រុមហ៊ុនជួលបម្រើការលក់គ្រឿងបាន់ប្រាក់របស់អតិថិជនតាមទំនាក់ប្រក្រតីស្មោះត្រង់មុខពីការបញ្ជាការជាផ្លូវបន្ទាល់ពិសេស។ និងអ្នកអាចសាកជាដើម្បីបញ្ចុះ',
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1),
            ),

            const SizedBox(height: 8),

            // Contact Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('ទំរង់មជ្ឈមណ្ឌល'),
                  const SizedBox(height: 16.0),
                  _buildContactInfoRow(
                    label: 'ឈ្មោះក្រុមហ៊ុន:',
                    value: 'សូមធុកៗ Phum Num Banh Chok',
                    highlight: true,
                  ),
                  _buildContactInfoRow(
                    label: 'អ៊ីមែល:',
                    value: 'phumnumbanhchok@gmail.com',
                    highlight: false,
                  ),
                  _buildContactInfoRow(
                    label: 'ទូរស័ព្ទ:',
                    value: '+855 12 467 992',
                    highlight: false,
                  ),
                  _buildContactInfoRow(
                    label: 'អាសយដ្ឋាន:',
                    value: 'ភូមិនំបញ្ចុក Phum Num Banh Chock Siem Reap, Cambodia 171201',
                    highlight: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildContactInfoRow({
    required String label,
    required String value,
    bool highlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black87,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: highlight ? const Color(0xFF84C341) : Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
