import 'package:get/get.dart';

import '../controllers/opportunity_sale_party_involved_controller.dart';

class OpportunitySalePartyInvolvedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunitySalePartyInvolvedController>(
      () => OpportunitySalePartyInvolvedController(),
    );
  }
}
