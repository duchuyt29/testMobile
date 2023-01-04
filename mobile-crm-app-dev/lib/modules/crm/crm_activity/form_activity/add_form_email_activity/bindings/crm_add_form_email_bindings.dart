import 'package:get/get.dart';

import '../controllers/crm_add_form_email_controller.dart';

class CrmAddFormEmailBinding extends Bindings {
  @override
  void dependencies() {
    final crmAddFormEmailController = CrmAddFormEmailController();
    Get.lazyPut<CrmAddFormEmailController>(() => crmAddFormEmailController);
  }
}
