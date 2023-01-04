import 'package:get/get.dart';

import '../controllers/crm_create_lead_product_controllers.dart';

class CrmCreateLeadProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateLeadProductController>(
      () => CrmCreateLeadProductController(),
    );
  }
}
