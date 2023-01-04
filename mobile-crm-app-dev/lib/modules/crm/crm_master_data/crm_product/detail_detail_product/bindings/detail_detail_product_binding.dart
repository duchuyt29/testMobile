import 'package:get/get.dart';

import '../controllers/detail_detail_product_controller.dart';

class CrmDetailDetailProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailDetailProductController>(
      () => CrmDetailDetailProductController(),
    );
  }
}
