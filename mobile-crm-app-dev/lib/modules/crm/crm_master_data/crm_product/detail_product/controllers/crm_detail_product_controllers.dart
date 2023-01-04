import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';
import '../views/widgets/lock_product_modal_bottom_sheet.dart';

class CrmDetailProductController extends GetxController {
  /* Action */
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  Future<void> showLockModalBottomSheet() async {
    await Get.bottomSheet(const LockProductModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }

  Future<void> onViewDetailDetailProduct() async {
    await Get.toNamed(CRMRoutes.CRM_PRODUCT_DETAIL_DETAIL);
  }

  Future<void> onViewInformationRelated() async {
    await Get.toNamed(CRMRoutes.CRM_PRODUCT_INFORMATION_RELATED);
  }
}
