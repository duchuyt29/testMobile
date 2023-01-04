import 'package:get/get.dart';

import '../controllers/detail_work_project_controller.dart';

class DetailWorkProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWorkProjectController>(
      () => DetailWorkProjectController(),
    );
  }
}
