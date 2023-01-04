import 'package:get/get.dart';

import '../controllers/account_address_form_controllers.dart';

class AccountAddressFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAddressFormController>(
      () => AccountAddressFormController(),
    );
  }
}
