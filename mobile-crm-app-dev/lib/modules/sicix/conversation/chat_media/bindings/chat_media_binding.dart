import 'package:get/get.dart';

import '../controllers/chat_media_controller.dart';

class ChatMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatMediaController>(
      () => ChatMediaController(Get.arguments),
    );
  }
}
