import 'package:get/get.dart';

import '../controllers/crm_lead_products_edit_controllers.dart';

class CrmLeadProductsEditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmLeadProductsEditController>(
      () => CrmLeadProductsEditController(),
    );
  }
}
