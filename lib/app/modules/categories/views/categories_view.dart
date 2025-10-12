import 'package:e_commerce_app/util/img_provider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController(), permanent: false);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('CategoriesView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 8),
                          // Search text
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "ស្វែងរក...",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          // “ទីតាំង” button inside search bar
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "ទីតាំង",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    icon: const Icon(Icons.phone, color: Colors.green),
                    onPressed: () {},
                  ),
                ],
              ),
              Obx(() => SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final cat = controller.categories[index];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              // child: CustomCachedImage(
                              //   imageUrl: cat['icon'].toString(),
                              child: Img.widget(
                                cat['icon'].toString(),
                                width: 40,
                                height: 40,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(cat['name'].toString()),
                          ],
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
