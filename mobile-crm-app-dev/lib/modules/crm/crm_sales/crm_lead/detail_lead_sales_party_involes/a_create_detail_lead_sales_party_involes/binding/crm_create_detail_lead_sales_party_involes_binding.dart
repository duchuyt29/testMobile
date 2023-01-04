import 'package:get/get.dart';

import '../controllers/crm_create_detail_lead_sales_party_involes_controllers.dart';

class CrmCreateDetailLeadSalePartyInvolesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateDetailLeadSalePartyInvolesController>(
        () => CrmCreateDetailLeadSalePartyInvolesController());
  }
}
