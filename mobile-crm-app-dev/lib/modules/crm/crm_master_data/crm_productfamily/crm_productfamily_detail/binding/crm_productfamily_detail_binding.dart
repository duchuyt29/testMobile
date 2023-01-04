import 'package:get/get.dart';

import '../controllers/crm_productfamily_detail_controller.dart';

class CrmProductFamilyDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmProductFamilyDetailController>(
      () => CrmProductFamilyDetailController(),
    );
  }
}
