import 'package:get/get.dart';

import '../controllers/crm_activity_controllers.dart';

class CrmActivityBinding extends Bindings {
  @override
  void dependencies() {
    final activityController = CrmActivityController();
    Get.lazyPut<CrmActivityController>(() => activityController);
  }
}
