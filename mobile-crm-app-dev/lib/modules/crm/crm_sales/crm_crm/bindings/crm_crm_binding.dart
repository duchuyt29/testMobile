import 'package:get/get.dart';

import '../controllers/crm_crm_controller.dart';

class CrmCrmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCrmController>(
      () => CrmCrmController(),
    );
  }
}
