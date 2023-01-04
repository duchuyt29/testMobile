import 'package:get/get.dart';

import '../controller/post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailController>(
      () => PostDetailController(Get.arguments),
    );
  }
}
