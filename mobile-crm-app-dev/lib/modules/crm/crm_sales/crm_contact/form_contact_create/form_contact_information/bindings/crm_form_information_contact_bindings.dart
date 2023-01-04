import 'package:get/get.dart';

import '../controllers/crm_form_information_contact_controllers.dart';

class CrmFromInformationContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmFromInformationContactController>(
      () => CrmFromInformationContactController(),
    );
  }
}
