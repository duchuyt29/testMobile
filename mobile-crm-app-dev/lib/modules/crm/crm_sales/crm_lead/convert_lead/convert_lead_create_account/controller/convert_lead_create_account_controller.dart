import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/document_type.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/request/lead/lead_convert_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../shared/constants/arguments.dart';

class CrmConvertLeadCreateAccountController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  LeadDetail? leadDetail;
  final leadConvertRequest = Rxn<LeadConvertRequest>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final documentController = TextEditingController();

  final indexAccountType = RxInt(0);
  final indexDocumentType = RxInt(0);
  final documentTypes = RxList<DocumentType>();

  /* Init */

  CrmConvertLeadCreateAccountController() {
    leadDetail = Get.arguments[LEAD_DETAIL] as LeadDetail?;
    leadConvertRequest.value =
        Get.arguments[LEAD_CONVERT_REQUEST] as LeadConvertRequest?;

    indexAccountType.value = leadConvertRequest.value?.indexAccountType ?? 0;
    indexDocumentType.value = leadConvertRequest.value?.indexDocumentType ?? 0;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    nameController.text = leadConvertRequest.value?.accountName ?? '';
    phoneController.text = leadConvertRequest.value?.accountPhone ?? '';
    documentController.text = leadConvertRequest.value?.documentNumber ?? '';

    if (phoneController.text.isEmpty) {
      phoneController.text = leadDetail?.leadPhone ?? '';
    }

    try {
      final accountType =
          crmMasterData?.listAccountAddressType?[indexAccountType.value];
      if (nameController.text.isEmpty) {
        nameController.text = (accountType?.id == 2)
            ? (leadDetail?.company ?? '')
            : (leadDetail?.leadName ?? '');
      }

      await _getDocumentType(accountType?.id);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  /* Action */

  Future onSelectedAccountType(int index) async {
    if (indexAccountType.value == index) {
      return;
    }

    try {
      fbKey.currentState!.fields['crm.account.kind.of.papers']?.reset();
      fbKey.currentState!.fields['crm.account.kind.of.papers']?.setValue(null);

      indexAccountType.value = index;
      indexDocumentType.value = 0;
      final accountType = crmMasterData?.listAccountType?[index];
      nameController.text = accountType?.id == 2
          ? (leadDetail?.company ?? '')
          : (leadDetail?.leadName ?? '');
      await _getDocumentType(accountType?.id);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future onSelectedDocmentType(int value) async {
    indexDocumentType.value = value;
  }

  Future<void> onCancel() async => Get.back();

  Future<void> onSave() async {
    if (fbKey.currentState!.saveAndValidate()) {
      leadConvertRequest.value?.accountName = nameController.text;
      leadConvertRequest.value?.accountPhone = phoneController.text;

      try {
        leadConvertRequest.value?.indexAccountType = indexAccountType.value;
        leadConvertRequest.value?.accountTypeId =
            crmMasterData?.listAccountType?[indexAccountType.value].id;
      } catch (e) {
        printError(info: e.toString());
      }
      try {
        leadConvertRequest.value?.indexDocumentType = indexDocumentType.value;
        leadConvertRequest.value?.documentTypeId =
            documentTypes[indexDocumentType.value].id;
      } catch (e) {
        printError(info: e.toString());
      }

      leadConvertRequest.value?.documentNumber = documentController.text;
      Get.back(result: leadConvertRequest.value);
    } else {
      await EasyLoading.showToast('Chưa điền đủ thông tin để tạo khách hàng!');
    }
  }

  /* Call API */

  Future<void> _getDocumentType(int? id) async {
    await EasyLoading.show();
    await crmUIRepository.getDocumentType(id ?? 1).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        documentTypes.value = response.data ?? [];
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: 'Get document type error: $onError');
    });
  }
}
