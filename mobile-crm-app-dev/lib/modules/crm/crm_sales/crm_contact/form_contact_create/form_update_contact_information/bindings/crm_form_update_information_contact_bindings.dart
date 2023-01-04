import 'package:get/get.dart';

import '../controllers/crm_form_update_information_contact_controllers.dart';

class CrmFromUpdateInformationContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmFromUpdateInformationContactController>(
      () => CrmFromUpdateInformationContactController(),
    );
  }
}
