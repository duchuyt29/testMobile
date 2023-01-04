import 'package:get/get.dart';

import '../controllers/detail_approve_controller.dart';

class DetailApproveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailApproveController>(
      () => DetailApproveController(),
    );
  }
}
