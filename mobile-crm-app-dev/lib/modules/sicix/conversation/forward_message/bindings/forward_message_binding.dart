import 'package:get/get.dart';

import '../controllers/forward_message_controller.dart';

class ForwardMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForwardMessageController>(
      () => ForwardMessageController(Get.arguments),
    );
  }
}
