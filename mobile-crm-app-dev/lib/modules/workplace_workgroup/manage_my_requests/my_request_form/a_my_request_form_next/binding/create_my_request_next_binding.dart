import 'package:get/get.dart';

import '../controller/creat_my_request_next_controller.dart';

class CrmCreateMyRequestNextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateMyRequestNextController>(
      () => CrmCreateMyRequestNextController(),
    );
  }
}
