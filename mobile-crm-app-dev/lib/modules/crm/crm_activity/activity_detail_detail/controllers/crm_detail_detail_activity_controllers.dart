import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../base/base_controller.dart';
import '../../activity_detail/views/widgets/change_status_acitivity_modal_sheet.dart';
import '../views/widgets/action_modal_sheet.dart';

class CrmDetailDetailActivityController extends BaseController {
  Future<void> showCreateModalBottomSheet() async {
    await Get.bottomSheet(
        ActionModalBottomSheet(
          onTap: Get.back,
        ),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ))).then((value) {
      Get.bottomSheet(const ChangeStatusActivityModalBottomSheets(),
          isScrollControlled: true,
          backgroundColor: Colors.grey.shade200,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )));
    });
  }
}
