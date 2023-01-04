import 'package:get/get.dart';

import '../controller/change_avatar_controller.dart';

class ChangeAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeAvatarController());
  }
}
