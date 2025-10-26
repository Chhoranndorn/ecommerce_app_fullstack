import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTopHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomTopHeader({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF84C341), // Green theme
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Menu Icon
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),

            // Location Icon
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.white),
              onPressed: () {},
            ),

            // Search Bar with Login Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SEARCH_PRODUCT);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.search, color: Colors.grey, size: 20),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "ស្វែងរក", // Search
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      // Login Button
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF84C341),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "ចូល", // Login
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 6),

            // Phone Icon
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.white),
              onPressed: () {},
            ),

            // Chat Icon
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
