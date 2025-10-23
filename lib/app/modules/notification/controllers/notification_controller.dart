import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement NotificationController

  // 2. Define the tabs
  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'ប្រវត្តិ'), // "History"
    Tab(text: 'ប្រតិបត្តិការ'), // "Operation"
  ];

  // 3. Declare the TabController
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    // 4. Initialize the TabController
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    // 5. Dispose the controller
    tabController.dispose();
    super.onClose();
  }
}
