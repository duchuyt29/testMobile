import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class CrmContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(
      () => ContactController(),
    );
  }
}
