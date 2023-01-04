import 'package:get/get.dart';

import '../controllers/opportunity_product_price_controller.dart';

class OpportunityProductPriceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpportunityProductPriceController>(
      () => OpportunityProductPriceController(),
    );
  }
}
