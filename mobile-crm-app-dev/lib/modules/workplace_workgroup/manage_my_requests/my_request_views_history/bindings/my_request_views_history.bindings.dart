import 'package:get/get.dart';

import '../controllers/my_request_views_history_controller.dart';

class MyRequestViewHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequestViewHistoryController>(
      () => MyRequestViewHistoryController(),
    );
  }
}
