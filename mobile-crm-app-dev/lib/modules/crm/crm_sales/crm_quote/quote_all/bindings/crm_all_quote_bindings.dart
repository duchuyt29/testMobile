import 'package:get/get.dart';

import '../controllers/crm_all_quote_controllers.dart';

class CrmAllQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAllQuoteController>(
      () => CrmAllQuoteController(),
    );
  }
}
