import 'package:get/get.dart';

import '../controllers/crm_opportunity_filter_controller.dart';

class OpportunityFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityFilterController>(
      () => OpportunityFilterController(),
    );
  }
}
