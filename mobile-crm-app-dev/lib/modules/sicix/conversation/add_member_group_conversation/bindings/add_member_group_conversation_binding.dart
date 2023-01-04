import 'package:get/get.dart';

import '../controllers/add_member_group_conversation_controller.dart';

class AddMemberGroupConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMemberGroupConversationController>(
      () => AddMemberGroupConversationController(Get.arguments),
    );
  }
}
