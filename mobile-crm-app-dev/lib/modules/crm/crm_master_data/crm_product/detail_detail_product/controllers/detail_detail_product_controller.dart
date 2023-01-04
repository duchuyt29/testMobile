import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../detail_product/views/widgets/lock_product_modal_bottom_sheet.dart';

class CrmDetailDetailProductController extends GetxController {
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
}
