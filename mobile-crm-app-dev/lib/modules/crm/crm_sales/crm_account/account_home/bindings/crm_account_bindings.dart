import 'package:get/get.dart';

import '../controllers/crm_account_controllers.dart';

class CrmAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAccountController>(
      () => CrmAccountController(),
    );
  }
}
