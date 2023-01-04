import 'package:get/get.dart';

import '../controllers/crm_quote_controller.dart';

class CrmQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmQuoteController>(
      () => CrmQuoteController(),
    );
  }
}
