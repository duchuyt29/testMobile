import 'package:get/get.dart';

import '../controllers/activity_account_controller.dart';

class ActivityAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivtyAccountController>(
      () => ActivtyAccountController(),
    );
  }
}
