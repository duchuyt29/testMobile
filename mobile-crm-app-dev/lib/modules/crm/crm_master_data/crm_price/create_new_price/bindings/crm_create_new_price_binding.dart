import 'package:get/get.dart';

import '../controllers/crm_create_new_price_controller.dart';

class CrmCreateNewPriceBinding extends Bindings {
  @override
  void dependencies() {
    final crmCreateNewPriceController = CrmCreateNewPriceController();
    Get.lazyPut<CrmCreateNewPriceController>(() => crmCreateNewPriceController);
  }
}
