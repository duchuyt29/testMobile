import 'package:get/get.dart';

import '../controllers/post_search_controller.dart';

class PostSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostSearchController>(() => PostSearchController());
  }
}
