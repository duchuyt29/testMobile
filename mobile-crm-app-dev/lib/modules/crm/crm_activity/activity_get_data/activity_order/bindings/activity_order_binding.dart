import 'package:get/get.dart';

import '../controllers/activity_order_controller.dart';

class ActivityOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivtyOrderController>(
      () => ActivtyOrderController(),
    );
  }
}
