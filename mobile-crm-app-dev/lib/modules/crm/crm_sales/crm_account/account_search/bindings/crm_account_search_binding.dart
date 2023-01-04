import 'package:get/get.dart';

import '../controllers/crm_account_search_controller.dart';

class CrmAccountSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAccountSearchController>(
      () => CrmAccountSearchController(),
    );
  }
}
