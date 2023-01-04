import 'package:get/get.dart';

import '../controllers/crm_lead_detail_controllers.dart';

class CrmLeadDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmLeadDetailController>(
      () => CrmLeadDetailController(),
    );
  }
}
