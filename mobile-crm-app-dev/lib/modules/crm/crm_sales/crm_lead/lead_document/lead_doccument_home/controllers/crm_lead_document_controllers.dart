import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/crm_pages.dart';
import '../views/widgets/delete_document_modal_bottom_sheet.dart';

class CrmLeadDocumentController extends GetxController {
  Future<void> onViewFormDocument() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_CREATE_FORM_DOCUMENT);
  }

  Future<void> showDeleteDocumentModalBottomSheet() async {
    await Get.bottomSheet(
      const DeleteDocumentModalBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
