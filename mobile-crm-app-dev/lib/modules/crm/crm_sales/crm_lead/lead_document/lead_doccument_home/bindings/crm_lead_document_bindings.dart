import 'package:get/get.dart';

import '../controllers/crm_lead_document_controllers.dart';

class CrmLeadDocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmLeadDocumentController>(
      () => CrmLeadDocumentController(),
    );
  }
}
