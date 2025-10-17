import 'package:get/get.dart';

import '../controllers/category_detail_view_controller.dart';

class CategoryDetailViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailViewController>(
      () => CategoryDetailViewController(),
    );
  }
}
