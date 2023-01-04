import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_address.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class AccountAddressViewController extends BaseController {
  final accountInfo = Rxn<AccountInfo>();
  final accountAddress = Rxn<List<AccountAddress>>();

  AccountAddressViewController() {
    if (Get.arguments != null) {
      accountInfo.value = Get.arguments as AccountInfo;
      accountAddress.value = accountInfo.value?.accountAddresses;
      accountAddress.value?.sort((a, b) => b.isMain!.compareTo(a.isMain ?? 0));
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
          accountInfo.value = response.data;
          accountAddress.value = response.data?.accountAddresses;
          accountAddress.value
              ?.sort((a, b) => b.isMain!.compareTo(a.isMain ?? 0));
          accountAddress.refresh();
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
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_ADDRESS_FORM,
        arguments: {ACCOUNT_INFO: accountInfo.value})?.then((value) {
      if (value != null) {
        _loadData();
        accountAddress.value
            ?.sort((a, b) => b.isMain!.compareTo(a.isMain ?? 0));
      }
    });
  }

  Future<void> edit(int id) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_ADDRESS_FORM, arguments: {
      ADDRESS_ID: id,
      ACCOUNT_INFO: accountInfo.value,
    })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  Future<void> onDeleteAddress(int id) async {
    try {
      await crmUIRepository.deleteAccountAddress(id).then((response) async {
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
