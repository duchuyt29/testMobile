import 'package:get/get.dart';

import '../controllers/request_needs_my_approval_detail_controller.dart';

class RequestNeedMyApprovalDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestNeedMyApprovalDetailController>(
      () => RequestNeedMyApprovalDetailController(),
    );
  }
}
