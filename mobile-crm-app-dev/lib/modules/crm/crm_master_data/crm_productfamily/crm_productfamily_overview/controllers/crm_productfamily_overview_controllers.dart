import 'package:get/get.dart';

import '../../../../../../data/app_data_global.dart';

import '../../../../../../routes/crm_pages.dart';
import '../../../../../../routes/sicix_pages.dart';

class CrmProductFamilyOverviewController extends GetxController {
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final language = RxString('language'.tr);

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      // _refreshPage();
    }
  }

  /* Action */

  Future<void> onChangeCompany() async {
    await Get.toNamed(SicixRoutes.CHOOSE_COMPANY)?.then((value) {
      if (value is bool && value) {
        companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
        // _refreshPage();
      }
    });
  }

  Future<void> addProductFamily() async {
    await Get.toNamed(CRMRoutes.CRM_PRODUCT_FAMILY_ADD);
  }
}
