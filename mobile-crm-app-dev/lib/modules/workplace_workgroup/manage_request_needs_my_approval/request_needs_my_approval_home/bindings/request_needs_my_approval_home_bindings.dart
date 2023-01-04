import 'package:get/get.dart';

import '../controllers/request_needs_my_approval_home_controller.dart';

class RequestNeedsMyApprovalHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestNeedsMyApprovalHomeController>(
      () => RequestNeedsMyApprovalHomeController(),
    );
  }
}
