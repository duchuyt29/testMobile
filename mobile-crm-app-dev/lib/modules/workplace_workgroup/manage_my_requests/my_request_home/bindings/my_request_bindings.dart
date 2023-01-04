import 'package:get/get.dart';

import '../controllers/my_request_controller.dart';

class MyRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequestController>(
      () => MyRequestController(),
    );
  }
}
