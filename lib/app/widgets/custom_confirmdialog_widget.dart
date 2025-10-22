import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final Color cancelColor;
  final Color confirmColor;

  const CustomConfirmDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = "ចូលគណនី", // Default text from your image
    this.cancelText = "បដិសេធ", // Default text from your image
    this.cancelColor = Colors.red,
    this.confirmColor = Colors.black,
  }) : super(key: key);

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
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24.0),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: Text(
                    cancelText,
                    style: TextStyle(
                      color: cancelColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onConfirm,
                  child: Text(
                    confirmText,
                    style: TextStyle(
                      color: confirmColor,
                      fontSize: 16,
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
}
