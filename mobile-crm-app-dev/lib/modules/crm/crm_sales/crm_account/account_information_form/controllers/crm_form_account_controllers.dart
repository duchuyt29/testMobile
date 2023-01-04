import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/app_util.dart';

class CrmCreateFormAccountController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  Rx<AccountInfo> accountInfo = Rx<AccountInfo>(AccountInfo());
  final userInfo = AppDataGlobal.userInfo;

  int? indexAccountType;
  int? indexIndustry;
  int? indexGender;
  String ownerEmployee = '';
  RxString parentName = ''.obs;
  int? parentId;

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController phone1 = TextEditingController();

  final TextEditingController email = TextEditingController();
  final TextEditingController note = TextEditingController();

  CrmCreateFormAccountController() {
    if (Get.arguments != null) {
      accountInfo.value = Get.arguments;
      name.text = accountInfo.value.accountName ?? '';
      phone.text = accountInfo.value.accountPhone ?? '';
      phone1.text = accountInfo.value.accountPhoneSecond ?? '';
      email.text = accountInfo.value.accountEmail ?? '';
      note.text = accountInfo.value.accountDescription ?? '';
      parentName.value = accountInfo.value.parentAccountName ?? '';
      parentId = accountInfo.value.parentAccountId;

      if (accountInfo.value.accountTypeId != null) {
        indexAccountType = crmMasterData?.listAccountType
            ?.indexWhere((e) => e.id == accountInfo.value.accountTypeId);
      }
      if (accountInfo.value.industryId != null) {
        indexIndustry = crmMasterData?.listIndustry
            ?.indexWhere((e) => e.id == accountInfo.value.industryId);
      }
      if (accountInfo.value.genderId != null) {
        indexGender = crmMasterData?.listGender
            ?.indexWhere((e) => e.id == (accountInfo.value.genderId ?? 0));
      }
    }

    ownerEmployee = accountInfo.value.id != null
        ? accountInfo.value.getOwnerEmployeeName()
        : (userInfo?.fullName ?? '');
  }
  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> selectGender(int index) async {
    try {
      accountInfo.value.genderId = crmMasterData?.listGender?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectIndustry(int index) async {
    try {
      accountInfo.value.industryId = crmMasterData?.listIndustry?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadParentAccount() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_ACCOUNT_LIST_ALL,
          arguments: {ACCOUNT_ID: parentId})?.then((value) {
        if (value != null && value is ActivityAccount) {
          parentName.value = value.accountName ?? '';
          parentId = value.id;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      if (!AppUtil.isPhoneNumber(phone.text)) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'account.change_profile.error.phone.invalid'.tr,
        );
        return;
      }

      if (email.text.isNotEmpty && !GetUtils.isEmail(email.text)) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'account.change_profile.error.email.invalid'.tr,
        );
        return;
      }

      accountInfo.value.accountName = name.text;
      accountInfo.value.accountPhone = phone.text;
      accountInfo.value.accountPhoneSecond = phone1.text;
      accountInfo.value.accountEmail = email.text;
      accountInfo.value.accountDescription = note.text;
      accountInfo.value.parentAccountId = parentId;
      await saveChange();
    }
  }

  Future<void> saveChange() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .updateAccount(accountInfo.value.id!, accountInfo.value)
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          Get.back(result: response.data);
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
