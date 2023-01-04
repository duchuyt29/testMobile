import 'package:get/get.dart';

import '../controllers/crm_detail_activity_controllers.dart';

class CrmDetailActivityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailActivityController>(
      () => CrmDetailActivityController(),
    );
  }
}
