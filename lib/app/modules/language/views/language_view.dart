import 'package:e_commerce_app/app/modules/language/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8DC63F), Color(0xFF6A932D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Icon(Icons.food_bank_outlined, size: 80, color: Colors.white70),
                SizedBox(height: 40),
                Text(
                  'choose_language'.tr, // From your translations
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                // Obx listens to changes in the controller
                Obx(() => Column(
                      children: [
                        buildLanguageTile(
                          language: 'lang_khmer'.tr,
                          value: 'km_KH',
                        ),
                        SizedBox(height: 15),
                        buildLanguageTile(
                          language: 'lang_english'.tr,
                          value: 'en_US',
                        ),
                      ],
                    )),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF6A932D),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // Call the controller method on press
                    onPressed: controller.continueToNextScreen,
                    child: Text(
                      'button_continue'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for the language tile
  Widget buildLanguageTile({required String language, required String value}) {
    final bool isSelected = controller.selectedLanguage.value == value;
    return InkWell(
      onTap: () {
        controller.changeLanguage(value);
      },
      child: AnimatedContainer(
        // 3. Add a duration for the animation
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut, // Optional: Adds a nice easing effect
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        // 4. Change decoration based on whether it's selected
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.25) // Brighter when selected
              : Colors.black.withOpacity(0.1), // Dimmer when not
          borderRadius: BorderRadius.circular(30),
          border: isSelected
              ? Border.all(color: Colors.white, width: 2) // White border
              : Border.all(color: Colors.transparent, width: 2), // No border
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // You can add your flag images here
                CircleAvatar(
                  child: Text(value.split('_')[0].toUpperCase()),
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                SizedBox(width: 20),
                Text(
                  language,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            Radio<String>(
              value: value,
              // Use the value from the controller
              groupValue: controller.selectedLanguage.value,
              onChanged: (val) {
                if (val != null) {
                  // Call the method in the controller
                  controller.changeLanguage(val);
                }
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.all(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
