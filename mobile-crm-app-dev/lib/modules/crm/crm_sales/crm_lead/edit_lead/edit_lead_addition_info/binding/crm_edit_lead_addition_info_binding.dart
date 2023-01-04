import 'package:get/get.dart';
import '../controller/crm_edit_lead_addition_info_controller.dart';

class CrmEditLeadAdditionInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmEditLeadAdditionInfoController>(
        () => CrmEditLeadAdditionInfoController());
  }
}
