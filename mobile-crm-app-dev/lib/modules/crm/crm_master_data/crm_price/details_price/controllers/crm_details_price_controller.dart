import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';
import '../views/widgets/delete_price_modal_bottom_sheet.dart';

class CrmDetailsPriceController extends GetxController {
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final language = RxString('language'.tr);

  Future<void> onViewRelatedInformation() async {
    await Get.toNamed(CRMRoutes.CRM_RELATED_INFORMATION_PRICE);
  }

  Future<void> showCreateModalBottomSheet() async {
    await Get.bottomSheet(const CreateDeletePriceModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }
}
