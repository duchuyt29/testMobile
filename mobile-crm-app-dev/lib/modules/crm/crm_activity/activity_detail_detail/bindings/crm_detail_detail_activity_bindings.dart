import 'package:get/get.dart';

import '../controllers/crm_detail_detail_activity_controllers.dart';

class CrmDetailDetailActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailDetailActivityController>(
      () => CrmDetailDetailActivityController(),
    );
  }
}
