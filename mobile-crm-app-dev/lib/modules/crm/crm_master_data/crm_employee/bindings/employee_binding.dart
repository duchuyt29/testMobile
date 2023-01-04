import 'package:get/get.dart';

import '../controllers/employee_controller.dart';

class CrmEmplyeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeController>(
      () => EmployeeController(),
    );
  }
}
