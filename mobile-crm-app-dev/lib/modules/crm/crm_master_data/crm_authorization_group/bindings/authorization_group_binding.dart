import 'package:get/get.dart';

import '../controllers/authorization_group_controller.dart';

class CrmAuthorizationGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthorizationGroupController>(
      () => AuthorizationGroupController(),
    );
  }
}
