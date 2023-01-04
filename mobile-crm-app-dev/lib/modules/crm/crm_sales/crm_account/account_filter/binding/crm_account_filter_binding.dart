import 'package:get/get.dart';

import '../controllers/crm_account_filter_controllers.dart';

class CrmAccountFilterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmAccountFilterController>(
      () => CrmAccountFilterController(),
    );
  }
}
