import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/app_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmFromUpdateInformationContactController extends BaseController {
  Rx<Contact> contact = Rx<Contact>(Contact());

  final fbKey = GlobalKey<FormBuilderState>();
  final userInfo = AppDataGlobal.userInfo;

  int? indexSalutation;
  int? indexGender;
  int? indexRelationType;
  int? indexCountryContact;
  int? indexCountryPermanent;
  RxString name = ''.obs;
  Rx<bool> accountRequired = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController employeeController = TextEditingController();
  final TextEditingController zipCodeContactController =
      TextEditingController();
  final TextEditingController addressContactController =
      TextEditingController();
  final TextEditingController zipCodePermanentController =
      TextEditingController();
  final TextEditingController addressPermanentController =
      TextEditingController();

  CrmFromUpdateInformationContactController() {
    if (Get.arguments != null) {
      contact.value = Get.arguments;
      nameController.text = contact.value.contactName ?? '';
      phoneController.text = contact.value.contactPhone ?? '';
      emailController.text = contact.value.contactEmail ?? '';
      titleController.text = contact.value.contactTitle ?? '';
      noteController.text = contact.value.contactDescription ?? '';

      if (contact.value.contactSalutationId != null) {
        indexSalutation = crmMasterData?.listSalutation
            ?.indexWhere((e) => e.id == contact.value.contactSalutationId);
      }
      if (contact.value.genderId != null) {
        indexGender = crmMasterData?.listGender
            ?.indexWhere((e) => e.id == contact.value.genderId);
      }
      if (contact.value.accountRelationTypeId != null) {
        indexRelationType = crmMasterData?.listAccountRelationType
            ?.indexWhere((e) => e.id == contact.value.accountRelationTypeId);
      }

      if (contact.value.contactBillingCountryId != null) {
        indexCountryContact = crmMasterData?.listCountry
            ?.indexWhere((e) => e.id == contact.value.contactBillingCountryId);
      }
      if (contact.value.contactShippingCountryId != null) {
        indexCountryPermanent = crmMasterData?.listCountry
            ?.indexWhere((e) => e.id == contact.value.contactShippingCountryId);
      }
    }

    employeeController.text = contact.value.id != null
        ? (contact.value.getOwnerEmployeeName())
        : (userInfo?.fullName ?? '');
  }

  Future<void> selectSalutation(int index) async {
    try {
      contact.value.contactSalutationId =
          crmMasterData?.listSalutation?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectGender(int index) async {
    try {
      contact.value.genderId = crmMasterData?.listGender?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectCustomer() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_ACCOUNT_LIST_ALL,
          arguments: {ACCOUNT_ID: contact.value.accountId})?.then((value) {
        if (value != null && value is ActivityAccount) {
          if (contact.value.accountId != value.id) {
            name.value = value.accountName ?? '';
            contact.value.accountId = value.id ?? 0;
            accountRequired.value = true;
          } else {
            name.value = '';
            contact.value.accountId = null;
            accountRequired.value = false;
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> clearCustomer() async {
    try {
      name.value = '';
      contact.value.accountId = null;
      if (contact.value.accountRelationTypeId == null) {
        accountRequired.value = false;
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectRelationType(int index) async {
    try {
      contact.value.accountRelationTypeId =
          crmMasterData?.listAccountRelationType?[index].id;
      contact.refresh();
      accountRequired.value = true;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> clearRelationType() async {
    try {
      contact.value.accountRelationTypeId = null;
      indexRelationType = null;
      fbKey.currentState!.fields['relationship_type']?.setValue(null);
      contact.refresh();
      if (contact.value.accountId == null) {
        accountRequired.value = false;
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      if (!AppUtil.isPhoneNumber(phoneController.text)) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'account.change_profile.error.phone.invalid'.tr,
        );
        return;
      }

      if (emailController.text.isNotEmpty &&
          !GetUtils.isEmail(emailController.text)) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'account.change_profile.error.email.invalid'.tr,
        );
        return;
      }

      if (contact.value.accountRelationTypeId != null &&
          contact.value.accountId == null) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'Chưa chọn khách hàng'.tr,
        );
        return;
      }

      contact.value.contactName = nameController.text;
      contact.value.contactPhone = phoneController.text;
      contact.value.contactEmail = emailController.text;
      contact.value.contactTitle = titleController.text;
      contact.value.contactDescription = noteController.text;
      await updateChange();
    }
  }

  Future<void> updateChange() async {
    try {
      await crmUIRepository
          .updateContact(contact.value.id!, contact.value)
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
