import 'package:get/get.dart';

import '../controllers/crm_form_account_controllers.dart';

class CrmCreateFormAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateFormAccountController>(
      () => CrmCreateFormAccountController(),
    );
  }
}
