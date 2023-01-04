import 'package:get/get.dart';

import '../controllers/create_group_conversation_controller.dart';

class CreateGroupConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateGroupConversationController>(
      () => CreateGroupConversationController(),
    );
  }
}
