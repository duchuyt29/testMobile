import 'package:get/get.dart';

import '../controllers/work_manage_time_controller.dart';

class ManageTimeWorkBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageTimeWorkController>(
      () => ManageTimeWorkController(),
    );
  }
}
