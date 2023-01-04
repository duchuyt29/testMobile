import 'package:get/get.dart';

import '../controllers/crm_all_lead_controllers.dart';

class CrmAllLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAllLeadController>(
      () => CrmAllLeadController(),
    );
  }
}
