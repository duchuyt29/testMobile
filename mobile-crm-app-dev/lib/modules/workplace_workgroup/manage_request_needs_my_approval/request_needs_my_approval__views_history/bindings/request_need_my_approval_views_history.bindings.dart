import 'package:get/get.dart';

import '../controllers/request_need_my_approval_views_history_controller.dart';

class RequestNeedMyApprovalViewHistoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestNeedMyApprovalViewHistoryController>(
      () => RequestNeedMyApprovalViewHistoryController(),
    );
  }
}
