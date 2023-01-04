import 'package:get/get.dart';

import '../controllers/crm_create_product_in_price_controller.dart';

class CrmCreateProductsInPriceBinding extends Bindings {
  @override
  void dependencies() {
    final crmCreateProductsInPriceController =
        CrmCreateProductsInPriceController();
    Get.lazyPut<CrmCreateProductsInPriceController>(
        () => crmCreateProductsInPriceController);
  }
}
