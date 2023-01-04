import 'package:get/get.dart';

import '../controller/convert_lead_create_account_controller.dart';

class CrmConvertLeadCreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmConvertLeadCreateAccountController>(
        () => CrmConvertLeadCreateAccountController());
  }
}
