import 'package:get/get.dart';

import '../controllers/account_address_view_controllers.dart';

class AccountAddressViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAddressViewController>(
      () => AccountAddressViewController(),
    );
  }
}
