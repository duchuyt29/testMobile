import 'package:get/get.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../routes/crm_pages.dart';

class CrmMdController extends BaseController {
  Future<void> onViewSettings() async {
    // await Get.toNamed(Routes.CRM_S);
  }

  void onViewCurrncyExchangeRate() {}

  Future<void> onViewActivity() async {
    await Get.toNamed(CRMRoutes.CRM_ACTIVITY);
  }

  Future<void> onViewMangeProduct() async {}
}
