import 'package:get/get.dart';

import '../controllers/crm_detail_detail_contact_controllers.dart';

class CrmDetailDetailContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailDetailContactController>(
      () => CrmDetailDetailContactController(),
    );
  }
}
