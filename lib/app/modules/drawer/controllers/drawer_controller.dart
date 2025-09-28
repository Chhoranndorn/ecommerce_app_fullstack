import 'package:get/get.dart';

class AppDrawerController  extends GetxController {
  // Example: track selected menu item
  var selectedMenu = ''.obs;

  void selectMenu(String menu) {
    selectedMenu.value = menu;
  }
}
