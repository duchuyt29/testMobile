import 'package:get/get.dart';

import '../controllers/crm_detail_lead_relevant_personal_controllers.dart';

class CrmDetailLeadRelevantPersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailLeadRelevantPersonalController>(
        () => CrmDetailLeadRelevantPersonalController());
  }
}
