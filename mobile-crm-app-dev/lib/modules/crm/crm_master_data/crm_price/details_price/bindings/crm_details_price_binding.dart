import 'package:get/get.dart';

import '../controllers/crm_details_price_controller.dart';

class CrmDetailsPriceBinding extends Bindings {
  @override
  void dependencies() {
    final crmDetailsPriceController = CrmDetailsPriceController();
    Get.lazyPut<CrmDetailsPriceController>(() => crmDetailsPriceController);
  }
}
