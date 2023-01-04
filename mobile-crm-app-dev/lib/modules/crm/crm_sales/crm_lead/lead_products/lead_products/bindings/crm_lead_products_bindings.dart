import 'package:get/get.dart';

import '../controllers/crm_lead_products_controllers.dart';

class CrmLeadProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmLeadProductsController>(
      () => CrmLeadProductsController(),
    );
  }
}
