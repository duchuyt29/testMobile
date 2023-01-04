import 'package:get/get.dart';

import '../controllers/crm_opportunity_additional_form_controller.dart';

class OpportunityAdditionalFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityAdditionalFormController>(
      () => OpportunityAdditionalFormController(),
    );
  }
}
