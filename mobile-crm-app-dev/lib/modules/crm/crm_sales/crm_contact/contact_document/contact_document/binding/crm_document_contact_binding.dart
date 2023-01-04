import 'package:get/get.dart';

import '../controllers/crm_document_contact_controllers.dart';

class CrmDocumentContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmDocumentContactController>(
        () => CrmDocumentContactController());
  }
}
