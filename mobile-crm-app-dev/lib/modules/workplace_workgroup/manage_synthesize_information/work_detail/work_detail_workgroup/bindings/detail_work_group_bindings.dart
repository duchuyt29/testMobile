import 'package:get/get.dart';

import '../controllers/detail_work_group_controller.dart';

class DetailWorkGroupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWorkGroupController>(
      () => DetailWorkGroupController(),
    );
  }
}
