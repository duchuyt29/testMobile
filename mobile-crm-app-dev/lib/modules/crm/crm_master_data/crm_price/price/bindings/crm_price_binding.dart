import 'package:get/get.dart';

import '../controllers/crm_price_controller.dart';

class CrmPriceBinding extends Bindings {
  @override
  void dependencies() {
    final crmpriceController = CrmPriceController();
    Get.lazyPut<CrmPriceController>(() => crmpriceController);
  }
}
