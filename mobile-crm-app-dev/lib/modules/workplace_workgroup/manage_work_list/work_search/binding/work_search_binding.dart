import 'package:get/get.dart';

import '../controller/work_search_controller.dart';

class WorkSearchBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WorkSearchController>(() => WorkSearchController());
  }
}
