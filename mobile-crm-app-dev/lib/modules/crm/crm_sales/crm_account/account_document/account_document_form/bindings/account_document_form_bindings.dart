import 'package:get/get.dart';

import '../controllers/account_document_form_controllers.dart';

class AccountDocumentFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDocumentFormController>(
      () => AccountDocumentFormController(),
    );
  }
}
