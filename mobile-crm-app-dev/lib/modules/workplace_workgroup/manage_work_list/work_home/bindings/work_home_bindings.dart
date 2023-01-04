import 'package:get/get.dart';

import '../controllers/work_home_controller.dart';

class WorkHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkHomeController>(
      () => WorkHomeController(),
    );
  }
}
