import 'package:get/get.dart';

import '../controller/workplace_edit_work_controller.dart';

class WorkplaceEditWorkBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WorkplaceEditWorkController>(
        () => WorkplaceEditWorkController());
  }
}
