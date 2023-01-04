import 'package:get/get.dart';

import '../controllers/to_be_completed_controller.dart';

class ToBeCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToBeCompletedController>(
      () => ToBeCompletedController(),
    );
  }
}
