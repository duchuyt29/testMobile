import 'package:get/get.dart';

import '../controllers/activity_lead_controller.dart';

class ActivityLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivtyLeadController>(
      () => ActivtyLeadController(),
    );
  }
}
