import 'package:get/get.dart';

import '../controllers/crm_add_price_standard_form_controllers.dart';

class CrmAddPriceStandardFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrmAddPriceStandardFormController());
  }
}
