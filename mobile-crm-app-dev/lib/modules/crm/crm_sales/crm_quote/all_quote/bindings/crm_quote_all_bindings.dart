import 'package:get/get.dart';

import '../controllers/crm_quote_all_controller.dart';

class CrmAllQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAllQuoteController>(
      () => CrmAllQuoteController(),
    );
  }
}
