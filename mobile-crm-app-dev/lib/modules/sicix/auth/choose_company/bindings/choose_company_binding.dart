import 'package:get/get.dart';

import '../controllers/choose_company_controller.dart';

class ChooseCompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseCompanyController>(
      () {
        return ChooseCompanyController(Get.arguments ?? false);
      },
    );
  }
}
