import 'package:get/get.dart';

import '../controller/work_view_history_controller.dart';

class WorkViewHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WorkViewHistoryController>(() => WorkViewHistoryController());
  }
}
