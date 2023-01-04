import 'package:get/get.dart';

import '../controllers/crm_product_family_controller.dart';

class CrmProductFamilyBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmProductFamilyController>(
      () => CrmProductFamilyController(),
    );
  }
}
