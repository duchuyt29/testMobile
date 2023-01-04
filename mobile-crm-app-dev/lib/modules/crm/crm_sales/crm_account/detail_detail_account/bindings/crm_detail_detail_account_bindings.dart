import 'package:get/get.dart';

import '../controllers/crm_detail_detail_account_controllers.dart';

class CrmDetailDetailAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailDetailAccountController>(
      () => CrmDetailDetailAccountController(),
    );
  }
}
