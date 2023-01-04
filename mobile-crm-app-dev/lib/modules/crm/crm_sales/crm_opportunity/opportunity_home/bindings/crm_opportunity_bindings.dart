import 'package:get/get.dart';

import '../controllers/crm_opportunity_controllers.dart';

class CrmOpportunityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmOpportunityController>(
      () => CrmOpportunityController(),
    );
  }
}
