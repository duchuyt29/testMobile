import 'package:get/get.dart';

import '../controllers/activity_contact_controller.dart';

class ActivityContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityContactController>(
      () => ActivityContactController(),
    );
  }
}
