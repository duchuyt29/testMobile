import 'package:get/get.dart';
import '../controller/crm_edit_lead_info_controller.dart';

class CrmEditLeadInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmEditLeadInfoController>(() => CrmEditLeadInfoController());
  }
}
