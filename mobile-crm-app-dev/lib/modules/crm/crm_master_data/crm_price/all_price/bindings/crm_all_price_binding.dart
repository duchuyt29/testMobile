import 'package:get/get.dart';

import '../controllers/crm_all_price_controller.dart';

class CrmAllPriceBinding extends Bindings {
  @override
  void dependencies() {
    final crmAllPriceController = CrmAllPriceController();
    Get.lazyPut<CrmAllPriceController>(() => crmAllPriceController);
  }
}
