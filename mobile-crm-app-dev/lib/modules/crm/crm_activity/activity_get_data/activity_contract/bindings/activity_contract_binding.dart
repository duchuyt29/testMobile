import 'package:get/get.dart';

import '../controllers/activity_contract_controller.dart';

class ActivityContractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivtyContractController>(
      () => ActivtyContractController(),
    );
  }
}
