import 'package:get/get.dart';
import '../controller/create_my_request_controller.dart';

class CrmCreateMyRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmCreateMyRequestController>(
      () => CrmCreateMyRequestController(),
    );
  }
}
