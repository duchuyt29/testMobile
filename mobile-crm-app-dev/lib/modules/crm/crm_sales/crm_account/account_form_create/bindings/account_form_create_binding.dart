import 'package:get/get.dart';

import '../controllers/account_form_create_controller.dart';

class AccountFormCreateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountFormCreateController>(
      () => AccountFormCreateController(),
    );
  }
}
