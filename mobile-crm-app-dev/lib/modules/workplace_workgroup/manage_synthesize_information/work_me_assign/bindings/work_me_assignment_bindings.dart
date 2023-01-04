import 'package:get/get.dart';

import '../controllers/work_me_assignment_controller.dart';

class TheMeAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TheMeAssignmentController>(
      () => TheMeAssignmentController(),
    );
  }
}
