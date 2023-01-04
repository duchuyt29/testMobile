import 'package:get/get.dart';

import '../controllers/crm_all_account_controllers.dart';

class CrmAllAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAllAccountController>(
      () => CrmAllAccountController(),
    );
  }
}
