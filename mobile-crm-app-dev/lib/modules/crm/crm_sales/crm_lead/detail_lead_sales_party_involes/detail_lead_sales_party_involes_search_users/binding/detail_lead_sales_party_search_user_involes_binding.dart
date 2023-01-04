import 'package:get/get.dart';

import '../controller/detail_lead_search_sale_party_involes_controller.dart';

class DetailLeadSearchUsersSalesPartyInvolesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DetailLeadSearchUsersSalesPartyInvolesController>(
        () => DetailLeadSearchUsersSalesPartyInvolesController());
  }
}
