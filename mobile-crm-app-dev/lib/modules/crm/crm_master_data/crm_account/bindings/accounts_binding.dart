import 'package:get/get.dart';

import '../controllers/accounts_controller.dart';

class CrmAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmAccountsController>(
      () => CrmAccountsController(),
    );
  }
}
