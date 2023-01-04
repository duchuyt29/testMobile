import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';

class CrmRelatedInformationController extends GetxController {
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  Future<void> onViewFromCreateProductInPrice() async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_PRODUCTS_IN_PRICE);
  }
}
