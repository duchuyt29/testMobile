import 'package:get/get.dart';

import '../controllers/opportunity_status_info_form_controller.dart';

class OpportunityStatusInfoFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityStatusInfoFormController>(
      () => OpportunityStatusInfoFormController(),
    );
  }
}
