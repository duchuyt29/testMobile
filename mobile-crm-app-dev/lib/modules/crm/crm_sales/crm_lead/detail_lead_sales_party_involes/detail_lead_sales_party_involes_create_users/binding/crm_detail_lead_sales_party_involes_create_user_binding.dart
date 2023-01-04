import 'package:get/get.dart';

import '../controllers/crm_detail_lead_sales_party_involes_create_user_controllers.dart';

class CrmDetailLeadSalePartyInvolesCreateUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDetailLeadSalePartyInvolesCreateUsersController>(
        () => CrmDetailLeadSalePartyInvolesCreateUsersController());
  }
}
