import 'package:get/get.dart';

import '../controllers/my_request_detail_controller.dart';

class MyRequestDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequestDetailController>(
      () => MyRequestDetailController(),
    );
  }
}
