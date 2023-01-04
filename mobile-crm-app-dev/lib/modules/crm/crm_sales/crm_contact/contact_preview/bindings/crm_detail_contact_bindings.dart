import 'package:get/get.dart';

import '../controllers/crm_detail_contact_controllers.dart';

class CrmDetailContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailContactController>(
      () => CrmDetailContactController(),
    );
  }
}
