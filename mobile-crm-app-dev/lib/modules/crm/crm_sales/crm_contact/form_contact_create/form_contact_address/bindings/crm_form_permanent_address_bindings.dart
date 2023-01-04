import 'package:get/get.dart';

import '../controllers/crm_form_address_contact_controllers.dart';

class CrmFromAddressContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmFromAddressContactController>(
      () => CrmFromAddressContactController(),
    );
  }
}
