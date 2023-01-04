import 'package:get/get.dart';

import '../controllers/activity_opp_controller.dart';

class ActivityOppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivtyOppController>(
      () => ActivtyOppController(),
    );
  }
}
