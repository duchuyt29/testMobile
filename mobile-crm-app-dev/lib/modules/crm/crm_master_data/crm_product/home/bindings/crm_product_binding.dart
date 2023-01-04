import 'package:get/get.dart';

import '../controllers/crm_product_controller.dart';

class CrmProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmProductController>(
      () => CrmProductController(),
    );
  }
}
