import 'package:get/get.dart';

import '../controllers/crm_relevant_personal_controllers.dart';

class CrmRelevantPersonalBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmRelevantPersonalController>(
        () => CrmRelevantPersonalController());
  }
}
