import 'package:get/get.dart';

import '../controllers/crm_address_district_controller.dart';

class CrmAddressDistrictBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAddressDistrictController>(
      () => CrmAddressDistrictController(),
    );
  }
}
