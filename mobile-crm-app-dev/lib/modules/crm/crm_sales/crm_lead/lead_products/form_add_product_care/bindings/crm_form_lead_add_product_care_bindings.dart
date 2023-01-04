import 'package:get/get.dart';

import '../controllers/crm_form_lead_add_product_care_controllers.dart';

class CrmCreateFormLeadAddProductCareBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateFormLeadAddProductCareController>(
      () => CrmCreateFormLeadAddProductCareController(),
    );
  }
}
