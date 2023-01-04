import 'package:get/get.dart';

import '../controllers/work_assignment_me_controller.dart';

class TheAssignmentOfMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TheAssignmentOfMeController>(
      () => TheAssignmentOfMeController(),
    );
  }
}
