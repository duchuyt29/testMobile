import 'package:get/get.dart';

import '../controllers/crm_all_product_controller.dart';

class CrmAllProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrmAllProductController());
  }
}
