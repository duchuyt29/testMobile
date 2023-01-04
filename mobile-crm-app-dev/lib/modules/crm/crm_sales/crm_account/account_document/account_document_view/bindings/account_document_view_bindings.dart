import 'package:get/get.dart';

import '../controllers/account_document_view_controllers.dart';

class AccountDocumentViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDocumentViewController>(
      () => AccountDocumentViewController(),
    );
  }
}
