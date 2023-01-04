import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_document.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class AccountDocumentViewController extends BaseController {
  final accountInfo = Rxn<AccountInfo>();
  final accountDocument = Rxn<List<AccountDocument>>();

  AccountDocumentViewController() {
    if (Get.arguments != null) {
      accountInfo.value = Get.arguments as AccountInfo;
      accountDocument.value = accountInfo.value?.accountDocuments;
    }
  }
  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getAccountDetail(accountInfo.value?.id ?? 0)
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success && response.data != null) {
          accountInfo.value = response.data!;
          accountDocument.value = response.data?.accountDocuments;
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

  Future<void> create() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_DOCUMENT_FORM,
        arguments: {ACCOUNT_INFO: accountInfo.value})?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  Future<void> edit(int id) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_DOCUMENT_FORM, arguments: {
      ACCOUNT_DOCUMENT_ID: id,
      ACCOUNT_INFO: accountInfo.value,
    })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  Future<void> onDeleteDocument(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'Xoá Giấy tờ',
      message:
          'Bạn có chắc chắn muốn xóa Giấy tờ này? \nGiấy tờ sẽ bị xóa vĩnh viễn',
      confirmTitle: 'confirm'.tr,
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }

  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteAccountDocument(id).then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: _loadData);
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
