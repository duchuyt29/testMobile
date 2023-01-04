import 'package:get/get.dart';

import '../controller/detail_lead_create_contact.dart';

class CrmDetailLeadCreateContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmDetailLeadCreateContactController>(
        () => CrmDetailLeadCreateContactController());
  }
}
