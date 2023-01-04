import 'package:get/get.dart';

import '../controllers/conversation_search_controller.dart';

class ConversationSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConversationSearchController>(
      () => ConversationSearchController(),
    );
  }
}
