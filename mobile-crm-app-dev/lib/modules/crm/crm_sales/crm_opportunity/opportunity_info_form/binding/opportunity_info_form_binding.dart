import 'package:get/get.dart';

import '../controllers/opportunity_info_form_controller.dart';

class OpportunityInfoFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityInfoFormController>(
      () => OpportunityInfoFormController(),
    );
  }
}
