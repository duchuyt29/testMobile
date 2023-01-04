import 'package:get/get.dart';

import '../controllers/member_conversation_controller.dart';

class MemberConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberConversationController>(
      () => MemberConversationController(Get.arguments),
    );
  }
}
