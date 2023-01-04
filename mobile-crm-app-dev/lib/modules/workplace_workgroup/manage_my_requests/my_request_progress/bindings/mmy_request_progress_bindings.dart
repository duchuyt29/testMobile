import 'package:get/get.dart';

import '../controllers/my_request_progress_controller.dart';

class MyRequestProgrestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequestProgressController>(
      () => MyRequestProgressController(),
    );
  }
}
