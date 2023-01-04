import 'package:get/get.dart';

import '../controllers/opportunity_product_form_controller.dart';

class OpportunityProductFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityProductFormController>(
      () => OpportunityProductFormController(),
    );
  }
}
