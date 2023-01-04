import 'package:get/get.dart';

import '../controllers/account_identification_view_controllers.dart';

class AccountIdentificationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountIdentificationViewController>(
      () => AccountIdentificationViewController(),
    );
  }
}
