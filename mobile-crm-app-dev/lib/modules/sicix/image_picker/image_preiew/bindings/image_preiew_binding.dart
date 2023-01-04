import 'package:get/get.dart';

import '../controllers/image_preiew_controller.dart';

class ImagePreiewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagePreiewController>(() => ImagePreiewController());
  }
}
