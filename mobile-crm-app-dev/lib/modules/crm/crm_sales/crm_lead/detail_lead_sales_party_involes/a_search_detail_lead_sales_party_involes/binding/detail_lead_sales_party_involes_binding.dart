import 'package:get/get.dart';

import '../controller/detail_lead_search_sale_party_involes_controller.dart';

class DetailLeadSearchSalesPartyInvolesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DetailLeadSearchSalesPartyInvolesController>(
        () => DetailLeadSearchSalesPartyInvolesController());
  }
}
