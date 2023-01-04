import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
