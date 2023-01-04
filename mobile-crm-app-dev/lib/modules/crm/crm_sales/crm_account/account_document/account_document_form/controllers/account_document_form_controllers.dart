import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_document.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/document_type.dart';
import 'package:ui_api/crm_api/request/account/account_document_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/date_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_single_selection.dart';

class AccountDocumentFormController extends BaseController {
  final accountInfo = Rxn<AccountInfo>();
  final fbKey = GlobalKey<FormBuilderState>();
  RxList<DocumentType> listDocumentType = RxList.empty(growable: true);

  int? documentId;
  RxInt indexDocumentType = 0.obs;
  DateTime? issueDate;
  final selectedType = Rxn<DocumentType>();

  List<AccountDocument> listDocument = [];

  final TextEditingController documentNumberController =
      TextEditingController();
  final TextEditingController issueDateController = TextEditingController();
  final TextEditingController issuePlaceController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final accountDocument = Rxn<AccountDocument>(AccountDocument());

  AccountDocumentFormController() {
    final arguments = Get.arguments as Map;
    accountInfo.value = arguments[ACCOUNT_INFO];

    if (arguments[ACCOUNT_DOCUMENT_ID] != null) {
      documentId = arguments[ACCOUNT_DOCUMENT_ID];
      final index = accountInfo.value?.accountDocuments
          ?.indexWhere((element) => element.id == documentId);
      accountDocument.value = accountInfo.value?.accountDocuments?[index!];

      documentNumberController.text =
          accountDocument.value?.documentNumber ?? '';
      issueDate = accountDocument.value?.issueDate;
      issueDateController.text = accountDocument.value?.issueDate != null
          ? DateUtil.formatDatetimeToString(
              accountDocument.value?.issueDate!.toUtc(),
              type: DateUtil.DATE_TYPE)
          : '';
      issuePlaceController.text = accountDocument.value?.issuePlace ?? '';
      noteController.text = accountDocument.value?.note ?? '';
    } else {
      accountDocument.value = AccountDocument();
    }
  }
  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadDocumentType(accountInfo.value?.accountTypeId ?? 0);
  }

  Future<void> _loadDocumentType(int id) async {
    try {
      await crmUIRepository.getDocumentType(id).then((response) async {
        await EasyLoading.dismiss();
        if (response.success && response.data != null) {
          listDocumentType.value = response.data!;
          listDocumentType.refresh();
          if (accountDocument.value?.documentTypeId != null) {
            indexDocumentType.value = listDocumentType.indexWhere(
                (e) => e.id == accountDocument.value?.documentTypeId);
            selectedType.value = listDocumentType[indexDocumentType.value];
          } else {
            accountDocument.value?.documentTypeId = listDocumentType[0].id;
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadType() {
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.account.kind.of.papers'.tr,
      child: WidgetSingleSelection<DocumentType>(
        items: listDocumentType
            .map((e) => SingleSelectionItem(e, e.documentTypeName ?? ''))
            .toList(),
        initialValue: selectedType.value,
        onSelectionChanged: (documentType) {
          selectedType.value = documentType;
          accountDocument.value?.documentTypeId = documentType.id;
        },
      ),
    );
  }

  Future<void> selectDate() async {
    await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      // styles
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      // select hour
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((date) {
      issueDate = DateTime(date!.year, date.month, date.day);

      issueDateController.text = issueDate != null
          ? DateUtil.formatDatetimeToString(issueDate!.toUtc(),
              type: DateUtil.DATE_TYPE)
          : '';
    });
  }

  //address
  Future<void> onSubmit() async {
    try {
      if (fbKey.currentState?.validate() ?? false) {
        accountDocument.value?.documentNumber = documentNumberController.text;
        accountDocument.value?.issueDate = issueDate;
        accountDocument.value?.issuePlace = issuePlaceController.text;
        accountDocument.value?.note = noteController.text;

        if (documentId != null) {
          await saveChange();
        } else {
          await insertChange();
        }
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> saveChange() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .updateAccountDocument(
              accountDocument.value!.id!,
              AccountDocumentRequest(
                accountId: accountInfo.value?.id,
                id: accountDocument.value?.id,
                documentTypeId: accountDocument.value?.documentTypeId,
                documentNumber: accountDocument.value?.documentNumber,
                issueDate: issueDate,
                issuePlace: accountDocument.value?.issuePlace,
                note: accountDocument.value?.note,
              ))
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: () {
                Get.back(result: true);
              });
        } else {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> insertChange() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .insertAccountDocument(AccountDocumentRequest(
        accountId: accountInfo.value?.id,
        id: accountDocument.value?.id,
        documentTypeId: accountDocument.value?.documentTypeId,
        documentNumber: accountDocument.value?.documentNumber,
        issueDate: accountDocument.value?.issueDate,
        issuePlace: accountDocument.value?.issuePlace,
        note: accountDocument.value?.note,
      ))
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: () {
                Get.back(result: true);
              });
        } else {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
