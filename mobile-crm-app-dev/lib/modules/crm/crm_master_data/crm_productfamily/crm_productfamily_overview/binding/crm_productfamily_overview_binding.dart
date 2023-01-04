import 'package:get/get.dart';

import '../controllers/crm_productfamily_overview_controllers.dart';

class CrmProductFamilyOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmProductFamilyOverviewController>(
        () => CrmProductFamilyOverviewController());
  }
}
