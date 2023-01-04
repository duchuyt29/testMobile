import 'package:get/get.dart';

import '../controllers/activity_qoute_controller.dart';

class ActivityQouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivtyQouteController>(
      () => ActivtyQouteController(),
    );
  }
}
