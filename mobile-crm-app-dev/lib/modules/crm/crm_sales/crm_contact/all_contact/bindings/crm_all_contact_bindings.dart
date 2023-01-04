import 'package:get/get.dart';

import '../controllers/crm_all_contact_controllers.dart';

class CrmAllContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAllContactController>(
      () => CrmAllContactController(),
    );
  }
}
