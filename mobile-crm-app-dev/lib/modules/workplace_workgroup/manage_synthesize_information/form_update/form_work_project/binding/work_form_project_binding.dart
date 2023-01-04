import 'package:get/get.dart';

import '../controller/work_form_project_controller.dart';

class WorkFormProjectbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkFormProjectController>(() => WorkFormProjectController());
  }
}
