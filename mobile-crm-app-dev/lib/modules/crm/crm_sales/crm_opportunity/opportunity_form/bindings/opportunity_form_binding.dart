import 'package:get/get.dart';

import '../controllers/opportunity_form_controller.dart';

class OpportunityFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityFormController>(
      () => OpportunityFormController(),
    );
  }
}
