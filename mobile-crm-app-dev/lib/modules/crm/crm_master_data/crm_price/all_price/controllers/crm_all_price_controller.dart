import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';

class CrmAllPriceController extends GetxController {
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final language = RxString('language'.tr);

  Future<void> onViewCreateNewPrice() async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_NEW_PRICE);
  }

  Future<void> onViewDetailsPrice() async {
    await Get.toNamed(CRMRoutes.CRM_DETAILS_PRICE);
  }
}
