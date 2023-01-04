import 'package:get/get.dart';
import '../controllers/account_contact_createrelation_controllers.dart';

class CrmAccountContactCreateRelationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CrmAccountContactCreateRelationControllers>(
        () => CrmAccountContactCreateRelationControllers());
  }
}
