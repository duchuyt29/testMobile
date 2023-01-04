import 'package:get/get.dart';

import '../controllers/crm_add_form_call_activity_controllers.dart';

class CrmAddFormCallBinding extends Bindings {
  @override
  void dependencies() {
    final crmAddFormCallController = CrmAddFormCallController();
    Get.lazyPut<CrmAddFormCallController>(() => crmAddFormCallController);
  }
}
