import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../crm_activity/activity/views/widgets/create_acitivity_modal_sheet.dart';
import '../views/widgets/delete_quote_modal_bottom_sheet.dart';

class CrmDetailQuoteController extends GetxController {
  /* Action */
  Future<void> showDeleteModalBottomSheet() async {
    await Get.bottomSheet(const DeleteQuoteModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }

  Future<void> showCrateActivityModalBottomSheet() async {
    await Get.bottomSheet(const CreateActivityModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }

  // Future<void> onViewDetailQuote() async {
  //   await Get.toNamed(CRMRoutes.CRM_QUOTE_DETAIL);
  // }

  // Future<void> onViewQuoteProduct() async {
  //   await Get.toNamed(CRMRoutes.CRM_QUOTE_PRODUCT);
  // }
}
