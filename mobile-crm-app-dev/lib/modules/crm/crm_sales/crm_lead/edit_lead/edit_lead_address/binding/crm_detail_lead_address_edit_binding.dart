import 'package:get/get.dart';
import '../controller/crm_detail_lead_address_edit_controller.dart';

class CrmEditLeadAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmEditLeadAddressController>(
        () => CrmEditLeadAddressController());
  }
}
