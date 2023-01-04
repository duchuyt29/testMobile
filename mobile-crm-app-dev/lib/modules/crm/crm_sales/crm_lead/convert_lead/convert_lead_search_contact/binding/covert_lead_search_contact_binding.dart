import 'package:get/get.dart';

import '../controller/convert_lead_search_contact_controller.dart';

class ConvertLeadSearchContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConvertLeadSearchContactController>(
        () => ConvertLeadSearchContactController());
  }
}
