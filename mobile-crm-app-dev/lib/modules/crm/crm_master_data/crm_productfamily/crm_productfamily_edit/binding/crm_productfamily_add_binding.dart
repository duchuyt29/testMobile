import 'package:get/get.dart';
import '../controllers/crm_productfamily_edit_controllers.dart';

class CrmProductFamilyEditBinding extends Bindings {
  @override
  // TODO: implement dependencies
  void dependencies() {
    final crmCreateNewProductFamily = CrmProductFamilyEditController();
    Get.lazyPut<CrmProductFamilyEditController>(
        () => crmCreateNewProductFamily);
  }
}
