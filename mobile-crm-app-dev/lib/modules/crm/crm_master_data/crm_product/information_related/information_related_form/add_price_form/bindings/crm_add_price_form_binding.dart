import 'package:get/get.dart';

import '../controllers/crm_add_price_form_controllers.dart';

class CrmAddPriceFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrmAddPriceFormController());
  }
}
