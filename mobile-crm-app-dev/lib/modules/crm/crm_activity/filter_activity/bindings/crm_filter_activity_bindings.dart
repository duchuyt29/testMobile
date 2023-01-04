import 'package:get/get.dart';

import '../controllers/crm_filter_activity_controllers.dart';

class CrmFilterActivityBinding extends Bindings {
  @override
  void dependencies() {
    final filterActivityController = CrmFilterActivityController();
    Get.lazyPut<CrmFilterActivityController>(() => filterActivityController);
  }
}
