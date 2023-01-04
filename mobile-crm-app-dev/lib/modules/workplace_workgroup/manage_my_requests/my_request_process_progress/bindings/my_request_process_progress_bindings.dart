import 'package:get/get.dart';

import '../controllers/my_request_process_progress_controller.dart';

class MyRequestProcessProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequestProcessProgressController>(
      () => MyRequestProcessProgressController(),
    );
  }
}
