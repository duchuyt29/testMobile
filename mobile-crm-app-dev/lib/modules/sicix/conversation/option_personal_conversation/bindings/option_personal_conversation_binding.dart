import 'package:get/get.dart';

import '../controllers/option_personal_conversation_controller.dart';

class OptionPersonalConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionPersonalConversationController>(
      () => OptionPersonalConversationController(),
    );
  }
}
