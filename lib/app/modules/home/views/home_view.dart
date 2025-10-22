import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:e_commerce_app/app/widgets/my_carousel_widget.dart';
import 'package:e_commerce_app/util/img_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../drawer/views/drawer_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerView(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.green,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.location_on,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                          // Expanded(
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       Get.toNamed(Routes.SEARCH_PRODUCT);
                          //     },
                          //     child: Expanded(
                          //       child: Container(
                          //         height: 40,
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(30),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(0.1),
                          //               spreadRadius: 1,
                          //               blurRadius: 5,
                          //             ),
                          //           ],
                          //         ),
                          //         child: Row(
                          //           children: [
                          //             const SizedBox(width: 8),
                          //             const Icon(Icons.search,
                          //                 color: Colors.grey),
                          //             const SizedBox(width: 8),
                          //             // Search text
                          //             const Expanded(
                          //               child: TextField(
                          //                 decoration: InputDecoration(
                          //                   hintText: "ស្វែងរក...",
                          //                   hintStyle:
                          //                       TextStyle(color: Colors.grey),
                          //                   border: InputBorder.none,
                          //                   isDense: true,
                          //                   contentPadding:
                          //                       EdgeInsets.symmetric(
                          //                           vertical: 8),
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(width: 6),
                          //             // “ទីតាំង” button inside search bar
                          //             Container(
                          //               margin: const EdgeInsets.only(right: 6),
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 12, vertical: 6),
                          //               decoration: BoxDecoration(
                          //                 color: Colors.green,
                          //                 borderRadius:
                          //                     BorderRadius.circular(30),
                          //               ),
                          //               child: const Text(
                          //                 "ទីតាំង",
                          //                 style: TextStyle(color: Colors.white),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
                                    const SizedBox(width: 8),
                                    const Icon(Icons.search,
                                        color: Colors.grey),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "ស្វែងរក...", // Search placeholder text
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
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
                          ),

                          const SizedBox(width: 6),
                          IconButton(
                            icon: const Icon(Icons.phone, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat_bubble_outline,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("recommend",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white)),
                          Spacer(),
                          Text("view_all",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Obx(() => SizedBox(
                            height: 140,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.specials.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 12,
                              ),
                              itemBuilder: (context, index) {
                                final item = controller.specials[index];
                                print("imagss:${item['image']}");
                                return SizedBox(
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Img.widget(
                                          item['image'].toString(),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.black38,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          item['name'].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -18),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => MyCarouselWidget(
                          items: controller.imageUrls.toList())),
                      Obx(() => SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categories.length,
                              itemBuilder: (context, index) {
                                final cat = controller.categories[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.CATEGORY_DETAIL_VIEW,
                                      // arguments: cat['name'].toString(),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 12),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade50,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          // child: CustomCachedImage(
                                          //   imageUrl: cat['icon'].toString(),
                                          child: Img.widget(
                                            cat['icon'].toString(),
                                            width: 40,
                                            height: 40,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(cat['name'].toString()),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                      const SizedBox(height: 20),
                      Obx(() => GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              final product = controller.products[index];
                              print("product_image: ${product['image']}");
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.PRODUCT_DETAIL);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(16)),
                                          // child: Image.network(
                                          child: Img.widget(
                                            product['image']
                                                .toString(), // ✅ NetworkImage
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product['name'].toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "\$${product['price']}",
                                                  style: const TextStyle(
                                                      color: Colors.green),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.add_shopping_cart,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
