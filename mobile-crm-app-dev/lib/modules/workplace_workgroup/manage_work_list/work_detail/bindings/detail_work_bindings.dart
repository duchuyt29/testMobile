import 'package:get/get.dart';

import '../controllers/detail_work_controller.dart';

class DetailWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWorkController>(
      () => DetailWorkController(),
    );
  }
}
