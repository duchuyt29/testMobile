import 'package:get/get.dart';

import '../controllers/crm_product_form_controller.dart';

class CrmProductFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmProductFormController>(
      () => CrmProductFormController(),
    );
  }
}
