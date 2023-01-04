import 'package:get/get.dart';

import '../controllers/create_personal_conversation_controller.dart';

class CreatePersonalConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePersonalConversationController>(
      () => CreatePersonalConversationController(),
    );
  }
}
