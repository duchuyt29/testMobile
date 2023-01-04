import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/widget/add_document_modal_bottom_sheet.dart';

class AttachmentsController extends GetxController {
  Future<void> showAddDocModalBottomSheet() async {
    await Get.bottomSheet(const AddDocumentModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }
}
