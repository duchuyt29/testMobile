import 'package:get/get.dart';

import '../controllers/opportunity_sale_party_involved_form_controller.dart';

class OpportunitySalePartyInvolvedFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunitySalePartyInvolvedFormController>(
      () => OpportunitySalePartyInvolvedFormController(),
    );
  }
}
