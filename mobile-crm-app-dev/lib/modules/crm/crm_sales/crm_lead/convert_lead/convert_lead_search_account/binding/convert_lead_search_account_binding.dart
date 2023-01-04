import 'package:get/get.dart';

import '../controller/convert_lead_search_account_controller.dart';

class ConvertLeadSearchAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConvertLeadSearchAccountController>(
        () => ConvertLeadSearchAccountController());
  }
}
