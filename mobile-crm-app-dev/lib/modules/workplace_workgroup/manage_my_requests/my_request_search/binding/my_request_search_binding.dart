import 'package:get/get.dart';

import '../controller/my_request_search_controller.dart';

class MyRequestSearchBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MyRequestSearchController>(() => MyRequestSearchController());
  }
}
