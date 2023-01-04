import 'package:get/get.dart';

import '../controllers/crm_create_lead_controllers.dart';

class CrmCreateLeadBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateLeadController>(
      () => CrmCreateLeadController(),
    );
  }
}
