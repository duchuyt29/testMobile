import 'package:get/get.dart';

import '../controller/work_form_create_controller.dart';

class WorkFormCreateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkFormCreateController>(() => WorkFormCreateController());
  }
}
