import 'package:get/get.dart';

import '../controller/crm_quote_product_controller.dart';

class CrmQuoteProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmQuoteProductController>(
      () => CrmQuoteProductController(),
    );
  }
}
