import 'package:get/get.dart';

import '../controllers/edit_profile_detail_controller.dart';

class EditProfileDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileDetailController>(
      () => EditProfileDetailController(),
    );
  }
}
