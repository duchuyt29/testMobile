import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';

class CrmAllQuoteController extends GetxController {
  Future<void> onViewDetailQuote() async {
    await Get.toNamed(CRMRoutes.CRM_QUOTE_DETAIL);
  }

  // Future onSearchAccount() async {
  //   await Get.toNamed(Routes.CRM_ACCOUNT_SEARCH);
  // }

  // Future<void> onViewFilterContact() async {
  //   await Get.toNamed(Routes.CRM_CONTACT_FILTER);
  // }
}
