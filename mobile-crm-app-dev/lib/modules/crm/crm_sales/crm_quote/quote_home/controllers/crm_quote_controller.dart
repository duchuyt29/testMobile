import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';

class CrmQuoteController extends GetxController {
  Future<void> onViewAllQuote() async {
    await Get.toNamed(CRMRoutes.CRM_QUOTE_ALL);
  }
}
