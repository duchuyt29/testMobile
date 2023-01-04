import 'package:get/get.dart';

import '../controllers/add_relevantpersonal_controllers.dart';

class CrmAddRelevantPersonalBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmAddRelevantPersonalController>(
        () => CrmAddRelevantPersonalController());
  }
}
