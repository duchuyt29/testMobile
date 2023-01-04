import 'package:get/get.dart';

import '../controllers/opportunity_product_controller.dart';

class OpportunityProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpportunityProductController());
  }
}
