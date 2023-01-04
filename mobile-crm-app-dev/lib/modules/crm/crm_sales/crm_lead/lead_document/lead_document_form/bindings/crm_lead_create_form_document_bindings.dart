import 'package:get/get.dart';

import '../controllers/crm_lead_create_form_document_controllers.dart';

class CrmCreateFormLeadDocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateFormLeadDocumentController>(
      () => CrmCreateFormLeadDocumentController(),
    );
  }
}
