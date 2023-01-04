import 'package:get/get.dart';

import '../controllers/crm_create_form_identification_controllers.dart';

class CrmCreateFormIdentificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateFormIdentificationController>(
      () => CrmCreateFormIdentificationController(),
    );
  }
}
