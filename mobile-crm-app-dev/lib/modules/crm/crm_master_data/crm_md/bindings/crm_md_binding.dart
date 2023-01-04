import 'package:get/get.dart';

import '../controllers/crm_md_controller.dart';

class CrmMdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmMdController>(() => CrmMdController());
  }
}
