import 'package:get/get.dart';

import '../controller/work_form_workgroup_controller.dart';

class WorkFormWorkgroupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkFormWorkgroupController>(
        () => WorkFormWorkgroupController());
  }
}
