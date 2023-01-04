import 'package:get/get.dart';

import '../controllers/crm_select_account_controller.dart';

class CrmSelectAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmSelectAccountController>(
      () => CrmSelectAccountController(),
    );
  }
}
