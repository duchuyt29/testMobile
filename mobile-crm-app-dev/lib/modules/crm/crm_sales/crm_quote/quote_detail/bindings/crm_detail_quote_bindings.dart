import 'package:get/get.dart';

import '../controllers/crm_detail_quote_controllers.dart';

class CrmDetailQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailQuoteController>(
      () => CrmDetailQuoteController(),
    );
  }
}
