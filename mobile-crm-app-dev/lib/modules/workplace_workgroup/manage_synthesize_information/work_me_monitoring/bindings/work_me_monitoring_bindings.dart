import 'package:get/get.dart';

import '../controllers/work_me_monitoring_controller.dart';

class TheMeMonitoringBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TheMeMonitoringController>(
      () => TheMeMonitoringController(),
    );
  }
}
