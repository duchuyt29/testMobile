import 'package:get/get.dart';

import '../controllers/crm_detail_product_controllers.dart';

class CrmDetailProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailProductController>(
      () => CrmDetailProductController(),
    );
  }
}
