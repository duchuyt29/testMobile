import 'package:get/get.dart';

import '../controllers/crm_filter_contact_controller.dart';

class CrmFilterContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmFilterContactController>(
      () => CrmFilterContactController(),
    );
  }
}
