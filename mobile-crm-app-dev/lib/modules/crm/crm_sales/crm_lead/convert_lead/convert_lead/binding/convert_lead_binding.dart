import 'package:get/get.dart';

import '../controller/convert_lead_controller.dart';

class ConvertLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConvertLeadController>(() => ConvertLeadController());
  }
}
