import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/crm_pages.dart';
import '../views/widget/delete_contact_modal_bottom_sheet.dart';

class CrmDocumentContactController extends GetxController {
  Future<void> onViewFormDocument() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_CREATE_FORM_DOCUMENT);
  }

  Future<void> showDeleteModalBottomSheet() async {
    await Get.bottomSheet(const DeleteContactModalBottomContactDocument(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }
}
