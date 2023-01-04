import 'package:get/get.dart';

import '../controller/detail_lead_sale_opportunity_info_controller.dart';

class CrmDetailLeadSalesOpportunityInfoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmDetailLeadSalesOpportunityInfoController>(
        () => CrmDetailLeadSalesOpportunityInfoController());
  }
}
