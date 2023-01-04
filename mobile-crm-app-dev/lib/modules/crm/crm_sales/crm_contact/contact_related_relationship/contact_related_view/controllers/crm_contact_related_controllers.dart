import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_contact.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
import 'package:ui_api/crm_api/models/contact/contact_account.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmContactRelatedControllers extends BaseController {
  final scrollController = ScrollController();

  Contact? contact;
  RxList<ContactAccount> listContactAccount = RxList<ContactAccount>();
  CrmContactRelatedControllers() {
    contact = Get.arguments;
    _loadData();
  }

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getContactRelated(contact?.id ?? 0)
          .then((response) async {
        if (response.success) {
          await EasyLoading.dismiss();
          listContactAccount.value = response.data!;
        } else {
          await EasyLoading.dismiss();
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

  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteAccountContact(id).then((response) async {
        if (response.success) {
          await _loadData();
        } else {
          await EasyLoading.dismiss();
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

  Future<void> showDeleteModalBottomSheet(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.account.contact.delete'.tr,
      message: 'crm.account.contact.delete_confirm'.tr,
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }
}
