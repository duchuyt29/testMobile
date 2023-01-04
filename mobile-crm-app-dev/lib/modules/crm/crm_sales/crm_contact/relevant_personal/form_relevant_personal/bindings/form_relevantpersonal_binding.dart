import 'package:get/get.dart';
import '../controllers/form_relevantpersonal_controller.dart';

class CrmCreateRelevantPersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateRelevantPersonalController>(
        () => CrmCreateRelevantPersonalController());
  }
}
