import 'package:get/get.dart';

import '../controllers/attachments_controller.dart';

class AttachmentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttachmentsController>(
      () => AttachmentsController(),
    );
  }
}
