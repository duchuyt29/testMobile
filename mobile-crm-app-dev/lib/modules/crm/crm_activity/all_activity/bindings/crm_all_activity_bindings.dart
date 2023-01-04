import 'package:get/get.dart';

import '../controllers/crm_all_activity_controllers.dart';

class CrmAllActivityBinding extends Bindings {
  @override
  void dependencies() {
    final allActivityController = CrmAllActivityController();
    Get.lazyPut<CrmAllActivityController>(() => allActivityController);
  }
}
