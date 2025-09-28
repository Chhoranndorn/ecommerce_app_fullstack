import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../drawer/views/drawer_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerView(), // 👈 Drawer only in Home
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Bar (Menu + Location + Search + Phone + Chat)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: const BoxDecoration(color: Colors.green),
                child: Row(
                  children: [
                    // Menu
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),

                    // Location Icon
                    IconButton(
                      icon: const Icon(Icons.location_on, color: Colors.white),
                      onPressed: () {},
                    ),

                    // Search field
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "ស្វែងរក...",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Location button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ទីតាំង",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),

                    const SizedBox(width: 6),

                    // Phone
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.white),
                      onPressed: () {},
                    ),

                    // Chat
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🌟 Specials
              Text("ពិសេសសម្រាប់អ្នក",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),

              Obx(() => SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.specials.length,
                      itemBuilder: (context, index) {
                        final item = controller.specials[index];
                        return Container(
                          width: 180,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(item["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black38,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item["name"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )),

              const SizedBox(height: 20),

              // 📂 Categories
              Text("ប្រភេទ", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),

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
                              child: Image.asset(
                                cat["icon"]!,
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(cat["name"]!),
                          ],
                        );
                      },
                    ),
                  )),

              const SizedBox(height: 20),

              // 🛍 Products Grid
              Text("ផលិតផលពេញនិយម",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),

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
                      return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16)),
                                child: Image.asset(
                                  product["image"]!.toString(),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product["name"]!.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$${product["price"]}",
                                    style: const TextStyle(
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
