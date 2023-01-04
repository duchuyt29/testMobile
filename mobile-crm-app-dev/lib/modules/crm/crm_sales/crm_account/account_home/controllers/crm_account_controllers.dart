import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';

class CrmAccountController extends GetxController {
  Future onSearchAccount() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_SEARCH);
  }

  Future<void> onViewAllAccount() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_ALL);
  }

  Future<void> onViewCreateNewAccount() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_CREATE_NEW);
  }
}
