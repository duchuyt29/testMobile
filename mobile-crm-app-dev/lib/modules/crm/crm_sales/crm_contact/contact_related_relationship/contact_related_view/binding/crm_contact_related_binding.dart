import 'package:get/get.dart';
import '../controllers/crm_contact_related_controllers.dart';

class CrmContactRelatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmContactRelatedControllers>(
        () => CrmContactRelatedControllers());
  }
}
