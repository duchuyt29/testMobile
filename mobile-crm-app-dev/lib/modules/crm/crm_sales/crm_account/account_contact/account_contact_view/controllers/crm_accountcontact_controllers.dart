import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_contact.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmAccountContactControllers extends BaseController {
  final scrollController = ScrollController();

  Account? account;
  RxList<AccountContact> listAccountContact = RxList<AccountContact>();
  CrmAccountContactControllers() {
    account = Get.arguments;
    _loadData();
  }

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getAccountContact(account?.id ?? 0)
          .then((response) async {
        if (response.success) {
          await EasyLoading.dismiss();
          listAccountContact.value = response.data!;
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

  Future<void> showCreateModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'crm.contact.involve.choose.subject'.tr,
        option: [
          MenuOptionModel(
              onAction: () {
                Get.back();
                onViewCreate(CommonConstants.accountObjectTypeContact);
              },
              title: 'crm.contact'.tr),
          MenuOptionModel(
              onAction: () {
                Get.back();
                onViewCreate(CommonConstants.accountObjectTypeAccount);
              },
              title: 'crm.customer'.tr),
        ],
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  Future<void> onViewCreate(int type) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_CONTACT_CREATE_RELATION,
        arguments: {
          OBJECT_TYPE: type,
          ACCOUNT_INFO: account,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  Future<void> onViewUpdate(AccountContact item) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_CONTACT_CREATE_RELATION,
        arguments: {
          OBJECT_TYPE: item.objectTypeId,
          ACCOUNT_INFO: account,
          ACCOUNT_CONTACT: item,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }
}
