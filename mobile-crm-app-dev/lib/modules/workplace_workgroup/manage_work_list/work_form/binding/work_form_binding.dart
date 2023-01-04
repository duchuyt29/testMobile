import 'package:get/get.dart';

import '../controller/work_form_controller.dart';

class WorkFormBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WorkFormController>(() => WorkFormController());
  }
}
