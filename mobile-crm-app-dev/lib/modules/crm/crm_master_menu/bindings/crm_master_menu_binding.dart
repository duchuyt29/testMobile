import 'package:get/get.dart';

import '../controllers/crm_master_menu_controller.dart';

class CrmMasterMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmMasterMenuController>(
      () => CrmMasterMenuController(),
    );
  }
}
