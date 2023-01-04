import 'package:get/get.dart';

import '../controllers/crm_detail_account_controllers.dart';

class CrmDetailAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailAccountController>(
      () => CrmDetailAccountController(),
    );
  }
}
