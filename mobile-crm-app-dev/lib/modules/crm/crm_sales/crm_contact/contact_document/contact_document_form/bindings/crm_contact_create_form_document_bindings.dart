import 'package:get/get.dart';

import '../controllers/crm_contact_create_form_document_controllers.dart';

class CrmCreateFormContactDocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateFormContactDocumentController>(
      () => CrmCreateFormContactDocumentController(),
    );
  }
}
