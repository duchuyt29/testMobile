import 'package:get/get.dart';

import '../controllers/crm_information_related_product_controller.dart';

class CrmInformationRelatedProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrmInformationRelatedProductController());
  }
}
