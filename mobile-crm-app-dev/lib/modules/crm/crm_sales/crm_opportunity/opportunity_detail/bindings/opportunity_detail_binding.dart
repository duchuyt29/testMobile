import 'package:get/get.dart';

import '../controllers/opportunity_detail_controller.dart';

class CrmOpportunityDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmOpportunityDetailController>(
        () => CrmOpportunityDetailController());
  }
}
