import 'package:get/get.dart';

import '../controllers/opportunity_detail_info_controller.dart';

class OpportunityDetailInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityDetailInfoController>(
      () => OpportunityDetailInfoController(),
    );
  }
}
