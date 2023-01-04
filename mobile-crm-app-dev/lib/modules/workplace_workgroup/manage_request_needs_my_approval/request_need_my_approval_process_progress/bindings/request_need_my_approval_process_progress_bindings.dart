import 'package:get/get.dart';

import '../controllers/request_need_my_approval_process_progress_controller.dart';

class RequestNeedMyApprovalProcessProgressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestNeedMyApprovalProcessProgressController>(
      () => RequestNeedMyApprovalProcessProgressController(),
    );
  }
}
