import 'package:get/get.dart';

import '../../../../../shared/constants/arguments.dart';
import '../controllers/pined_conversation_controller.dart';

class PinedConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinedConversationController>(() {
      return PinedConversationController(
        convesation: Get.arguments[CONVERSATION_ARGUMENT],
        messagePinGroups: Get.arguments[PIN_GROUP_ARGUMENT],
        messagePinPrivates: Get.arguments[PIN_PRIVATE_ARGUMENT],
      );
    });
  }
}
