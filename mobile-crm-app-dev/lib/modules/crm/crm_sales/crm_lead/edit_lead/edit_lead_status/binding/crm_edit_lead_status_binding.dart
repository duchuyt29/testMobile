import 'package:get/get.dart';
import '../controller/crm_edit_lead_status_controller.dart';

class CrmEditLeadStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmEditLeadStatusController>(
        () => CrmEditLeadStatusController());
  }
}
