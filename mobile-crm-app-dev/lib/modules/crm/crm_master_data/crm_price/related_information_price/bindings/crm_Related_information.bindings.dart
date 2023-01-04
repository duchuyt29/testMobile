import 'package:get/get.dart';

import '../controllers/crm_Related_information.controller.dart';

class CrmRelatedInformationBinding extends Bindings {
  @override
  void dependencies() {
    final crmRelatedInformationController = CrmRelatedInformationController();
    Get.lazyPut<CrmRelatedInformationController>(
        () => crmRelatedInformationController);
  }
}
