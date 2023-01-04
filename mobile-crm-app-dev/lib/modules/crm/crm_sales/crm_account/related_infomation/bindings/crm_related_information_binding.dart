import 'package:get/get.dart';

import '../controllers/crm_account_related_infomation.dart';

class CrmAccountRelatedInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAccountRelatedInformationController>(
      () => CrmAccountRelatedInformationController(),
    );
  }
}
