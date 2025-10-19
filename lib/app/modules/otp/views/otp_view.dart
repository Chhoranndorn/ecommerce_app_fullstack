import 'package:e_commerce_app/app/modules/otp/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter
import 'package:get/get.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () =>
              Get.back(), // Go back to the previous screen (SignIn)
        ),
      ),
      extendBodyBehindAppBar: true, // Make app bar transparent over body
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
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                // Logo/Icon
                Icon(Icons.food_bank_outlined, size: 80, color: Colors.white70),
                SizedBox(height: 40),

                // Title
                Text(
                  'otp_title'.tr,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                // Instruction Text
                Text(
                  'otp_instruction'.tr, // "We have sent an OTP..."
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30),

                // OTP Input Fields (Using Obx to react to controller changes)
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        controller.otpDigits.length,
                        (index) => _buildOtpField(context, index),
                      ),
                    )),
                SizedBox(height: 30),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // White button as per image
                      foregroundColor: Color(0xFF6A932D), // Green text
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    onPressed: controller.verifyOtp,
                    child: Text(
                      'verify_button'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Resend OTP (Optional)
                GestureDetector(
                  onTap: controller.resendOtp,
                  child: Text(
                    'resend_otp'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                Spacer(),
                // Bottom food images from the background
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, int index) {
    return SizedBox(
      width: 45, // Adjust width as needed
      height: 55, // Adjust height as needed
      child: TextField(
        controller:
            controller.otpTextControllers[index], // Use specific controller
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1, // Only one digit per field
        decoration: InputDecoration(
          counterText: "", // Hide the counter text (0/1)
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // No border for solid look
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Color(0xFF6A932D), width: 2), // Highlight focused
          ),
        ),
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Only allow digits
        ],
        onChanged: (value) {
          if (value.length == 1 && index < controller.otpDigits.length - 1) {
            FocusScope.of(context).nextFocus(); // Move to next field
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context)
                .previousFocus(); // Move to previous field on backspace
          }
          controller.updateOtpDigit(index, value); // Update controller state
        },
      ),
    );
  }
}
