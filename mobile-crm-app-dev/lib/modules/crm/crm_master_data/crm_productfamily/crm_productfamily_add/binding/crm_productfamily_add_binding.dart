import 'package:get/get.dart';
import '../controllers/crm_productfamily_add_controllers.dart';

class CrmProductFamilyAddBinding extends Bindings {
  @override
  // TODO: implement dependencies
  void dependencies() {
    final crmCreateNewProductFamily = CrmProductFamilyAddController();
    Get.lazyPut<CrmProductFamilyAddController>(() => crmCreateNewProductFamily);
  }
}
