import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/widget/change_status_modal_bottom_sheet.dart';

class DetailApproveController extends GetxController {
  Future<void> showChangeStatusModalBottomSheet() async {
    await Get.bottomSheet(const ChangeStatusModalBottomSheets(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }
}
