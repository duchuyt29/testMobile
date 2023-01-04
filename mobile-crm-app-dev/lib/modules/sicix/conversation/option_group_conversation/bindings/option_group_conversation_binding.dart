import 'package:get/get.dart';

import '../controllers/option_group_conversation_controller.dart';

class OptionGroupConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionGroupConversationController>(
      () => OptionGroupConversationController(),
    );
  }
}
