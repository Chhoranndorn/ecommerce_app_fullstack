import 'package:e_commerce_app/app/modules/Feedback/controllers/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);

  // Define colors from the screenshot
  static const Color primaryGreen = Color(0xFF6A994E);
  static const Color primaryRed = Color(0xFFE53935);
  static const Color cardBg = Color(0xFFFCFAF0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('មតិកែលម្អ'), // Feedback
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Main Feedback Card ---
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ផ្តល់មតិយោបល់', // Provide Feedback
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // --- Emotion Selector ---
                  _buildEmotionSelector(),
                  const SizedBox(height: 24.0),

                  const Text(
                    'តើអ្វីជាមូលហេតុចម្បងនៃការវាយតម្លៃរបស់អ្នក?', // What is the main reason for your rating?
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // --- Comment Box ---
                  TextFormField(
                    controller: controller.commentController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'សរសេរមតិយោបល់នៅទីនេះ...', // Write comment here
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // --- Checkboxes ---
            _buildCheckboxes(context),
          ],
        ),
      ),
      // --- Bottom Buttons ---
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  // Helper widget for the emotion selector row
  Widget _buildEmotionSelector() {
    // List of icons and labels
    final emotions = [
      {'icon': Icons.sentiment_very_dissatisfied, 'label': 'ខ្លាំងណាស់'},
      {'icon': Icons.sentiment_dissatisfied, 'label': 'មិនល្អ'},
      {'icon': Icons.sentiment_neutral, 'label': 'មិនអីទេ'},
      {'icon': Icons.sentiment_satisfied, 'label': 'ល្អ'},
      {'icon': Icons.sentiment_very_satisfied, 'label': 'ល្អណាស់'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(emotions.length, (index) {
        return GestureDetector(
          onTap: () => controller.selectEmotion(index),
          child: Obx(
            () {
              // Check if this icon is selected
              final bool isSelected =
                  controller.selectedEmotionIndex.value == index;
              // Change color based on selection
              final Color iconColor =
                  isSelected ? primaryGreen : Colors.grey[600]!;

              return Column(
                children: [
                  Icon(
                    emotions[index]['icon'] as IconData,
                    size: 36.0,
                    color: iconColor,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    emotions[index]['label'] as String,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: iconColor,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }

  // Helper widget for the checkboxes
  Widget _buildCheckboxes(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => CheckboxListTile(
            value: controller.checkbox1.value,
            onChanged: controller.toggleCheckbox1,
            title: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: const [
                  TextSpan(text: 'ខ្ញុំអាចត្រូវបានទាក់ទងអំពីមតិកែលម្អនេះ។ '),
                  TextSpan(
                    text: 'គោលការណ៍ភាពឯកជន',
                    style: TextStyle(color: primaryGreen),
                  ),
                ],
              ),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: primaryGreen,
          ),
        ),
        Obx(
          () => CheckboxListTile(
            value: controller.checkbox2.value,
            onChanged: controller.toggleCheckbox2,
            title: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: const [
                  TextSpan(text: 'ខ្ញុំចង់ផ្តល់មតិយោបល់ដោយមិនបញ្ចេញឈ្មោះ '),
                  TextSpan(
                    text: 'ក្រុមគ្រួសារ',
                    style: TextStyle(color: primaryGreen),
                  ),
                ],
              ),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: primaryGreen,
          ),
        ),
      ],
    );
  }

  // Helper widget for the bottom navigation buttons
  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0).copyWith(
        bottom: 32.0, // Extra padding for the home indicator
      ),
      color: Colors.white, // Ensure it has a background
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: controller.cancel,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryRed,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'បដិសេធ', // Cancel
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              onPressed: controller.submitFeedback,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'យល់ព្រម', // Submit
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
