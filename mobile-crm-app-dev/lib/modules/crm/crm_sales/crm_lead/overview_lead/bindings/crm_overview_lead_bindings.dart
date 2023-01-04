import 'package:get/get.dart';

import '../controllers/crm_overview_lead_controllers.dart';

class CrmOverviewLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmOverviewLeadController>(
      () => CrmOverviewLeadController(),
    );
  }
}
