import 'package:get/get.dart';

import '../controllers/crm_address_ward_controller.dart';

class CrmAddressWardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAddressWardController>(
      () => CrmAddressWardController(),
    );
  }
}
