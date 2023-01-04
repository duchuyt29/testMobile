import 'package:get/get.dart';

import '../controllers/crm_relevant_personal_contact_controllers.dart';

class CrmRelevantPersonalContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmRelevantPersonalContactController>(
        () => CrmRelevantPersonalContactController());
  }
}
