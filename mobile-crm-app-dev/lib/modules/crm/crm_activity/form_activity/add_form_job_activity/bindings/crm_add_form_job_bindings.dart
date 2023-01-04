import 'package:get/get.dart';

import '../controllers/crm_add_form_job_controller.dart';

class CrmAddFormJobBinding extends Bindings {
  @override
  void dependencies() {
    final crmAddFormJobController = CrmAddFormJobController();
    Get.lazyPut<CrmAddFormJobController>(() => crmAddFormJobController);
  }
}
