import 'package:get/get.dart';

import '../controllers/manage_time_form_controller.dart';

class ManageTimeFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageTimeFormController>(
      () => ManageTimeFormController(),
    );
  }
}
