import 'package:get/get.dart';

import '../controllers/crm_address_province_controller.dart';

class CrmAddressProvinceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAddressProvinceController>(
      () => CrmAddressProvinceController(),
    );
  }
}
