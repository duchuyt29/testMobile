import 'package:get/get.dart';

import '../controllers/crm_lead_filter_controllers.dart';

class CrmLeadFilterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmLeadFilterController>(
      () => CrmLeadFilterController(),
    );
  }
}
