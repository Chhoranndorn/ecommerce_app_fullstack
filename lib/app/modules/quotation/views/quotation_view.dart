import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotationView extends StatelessWidget {
  const QuotationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'invoice_title'.tr, // "មើលវិក្កយបត្រ" - View Invoice
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCustomerAndVendorInfo(),
                SizedBox(height: 20),
                _buildOrderSummaryTable(),
                SizedBox(height: 20),
                _buildPaymentStatus(),
                SizedBox(height: 20),
                _buildNoteSection(),
                SizedBox(height: 20),
                _buildSignatureSection(),
                SizedBox(height: 100), // Space for the floating action button
              ],
            ),
          ),
          _buildPdfButton(), // Floating PDF button at the bottom
        ],
      ),
    );
  }

  // --- REVISED WIDGET ---
  Widget _buildCustomerAndVendorInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column (Customer Info)
          Expanded(
            flex: 3, // Give more space to the left side
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('អតិថិជន:', 'Theavann'),
                _buildInfoRow(null, 'theavann@gmail.com'),
                _buildInfoRow(null, '+855 123 456 78'),
                _buildInfoRow('ប័ណ្ណកម្មសិទ្ធិ', null), // Label with no value
                _buildInfoRow('កាលបរិច្ឆេទ:', '20/10/2025'),
                _buildInfoRow('អ្នកទទួល:', 'Theavann'),
              ],
            ),
          ),
          SizedBox(width: 16),
          // Right Column (Vendor Info)
          Expanded(
            flex: 2, // Give less space to the right
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Images.splashLogo, // Placeholder for your logo
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Phum Num Banh Chok',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4),
                Text(
                  'ភូមិ 87EO ផ្លូវ 2028 សង្កាត់ ៧៣១៧៤ ខណ្ឌ ៧៣១៧៤ រាជធានីភ្នំពេញ',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                SizedBox(height: 4),
                Text(
                  'phumnumbanchok@gmail.com',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                SizedBox(height: 4),
                Text(
                  '+855 12 487 992',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- REVISED HELPER ---
  // This helper can now handle (label, value), (null, value), and (label, null)
  Widget _buildInfoRow(String? label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label.tr,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          if (value != null)
            Text(
              value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
        ],
      ),
    );
  }

  // --- REVISED WIDGET ---
  Widget _buildOrderSummaryTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'label_order_details'.tr, // "សង្ខេបអំពី..."
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(height: 1),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(0.5),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1.5),
                4: FlexColumnWidth(1.5),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade200, width: 1)),
                  ),
                  children: [
                    _buildTableHeaderCell('ល.រ'), // Changed from លេខ
                    _buildTableHeaderCell('ការពិពណ៌នា'),
                    _buildTableHeaderCell('ចំនួន'),
                    _buildTableHeaderCell('តម្លៃឯកតា'),
                    _buildTableHeaderCell('សរុប'),
                  ],
                ),
                _buildTableRow('1', 'កាំបិតរណារ', '1', '\$10.00', '\$10.00'),
                _buildTableRow('2', 'ដបទឹកសុទ្ធ', '1', '\$3.00', '\$3.00'),
                _buildTableRow('3', 'ការធ្វើសេវាកម្ម', '1', '\$1.00', '\$1.00'),
              ],
            ),
          ),
          // --- ADDED DIVIDERS FOR TOTALS ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Colors.blue[600], thickness: 1),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: _buildTotalRow('សរុបបណ្តោះអាសន្ន', '\$14.00'), // Subtotal
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Colors.blue[600], thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
            child: _buildTotalRow('សរុប', '\$14.00',
                bold: true, big: true, color: Colors.black), // Total
          ),
        ],
      ),
    );
  }

  TableCell _buildTableHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          text.tr,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  TableRow _buildTableRow(
      String num, String desc, String qty, String unitPrice, String total) {
    return TableRow(
      children: [
        _buildTableCell(num, TextAlign.center),
        _buildTableCell(desc.tr, TextAlign.start),
        _buildTableCell(qty, TextAlign.center),
        _buildTableCell(unitPrice, TextAlign.end),
        _buildTableCell(total, TextAlign.end),
      ],
    );
  }

  TableCell _buildTableCell(String text, TextAlign align) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 13, color: Colors.grey[800]),
          textAlign: align,
        ),
      ),
    );
  }

  Widget _buildTotalRow(String label, String value,
      {bool bold = false, bool big = false, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label.tr,
          style: TextStyle(
            fontSize: big ? 16 : 14,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            color: color ?? Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: big ? 18 : 14,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'payment_status_title'.tr, // "ការណែនាំអំពី..."
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
        ),
        SizedBox(height: 8),
        Text(
          'payment_status_detail'.tr, // "ការបង់ប្រាក់បានទទួល..."
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'note_title'.tr, // "សម្គាល់:"
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'note_content'.tr, // "សូមអរគុណ..."
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  // --- NEW WIDGET ---
  Widget _buildSignatureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 150, // Width for the signature line
          height: 1,
          color: Colors.black,
        ),
        SizedBox(height: 8),
        Text(
          'signature_line'.tr, // "អរគុណសម្រាប់ការទិញទំនិញ..."
          style: TextStyle(
            fontSize: 12,
            color: Colors.green[800],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPdfButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16,
            Get.mediaQuery.padding.bottom + 16), // Adjust padding for safe area
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6A932D), // Green
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
          ),
          onPressed: () {
            // Handle PDF generation/download
            Get.snackbar(
              'PDF',
              'Generating PDF...',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Text(
            'generate_pdf'.tr, // "ទាញយក (PDF)" - Download (PDF)
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
