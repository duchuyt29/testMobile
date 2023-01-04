import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_contact.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
import 'package:ui_api/crm_api/request/account/account_contact_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class CrmAccountContactCreateRelationControllers extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  RxInt type = 0.obs;
  RxString name = ''.obs;
  Account? account;
  AccountContact? accountContact;

  int? indexRole;
  int? accountRelationTypeId;
  int? contactId;
  int? authorizationGroupId;
  final TextEditingController typeController = TextEditingController();

  CrmAccountContactCreateRelationControllers() {
    final arguments = Get.arguments as Map;
    type.value = arguments[OBJECT_TYPE];
    account = arguments[ACCOUNT_INFO];
    accountContact = arguments[ACCOUNT_CONTACT];

    typeController.text = type.value == CommonConstants.accountObjectTypeContact
        ? 'crm.contact'.tr
        : 'crm.customer'.tr;

    if (accountContact?.id != null) {
      name.value = accountContact?.contactName ?? '';
      accountRelationTypeId = accountContact?.accountRelationTypeId;
    }

    if (accountContact?.accountRelationTypeId != null) {
      indexRole = crmMasterData?.listAccountRelationType
          ?.indexWhere((e) => e.id == accountContact?.accountRelationTypeId);
    }
  }

  Future<void> loadEmployee() async {
    try {
      if (type.value == CommonConstants.accountObjectTypeContact) {
        await Get.toNamed(CRMRoutes.CRM_CONTACT_ALL_MASTER,
            arguments: {CONTACT_ID: contactId})?.then(
          (value) {
            if (value != null && value is Contact) {
              name.value = value.contactName ?? '';
              contactId = value.id;
            }
          },
        );
      } else {
        await Get.toNamed(CRMRoutes.CRM_ACCOUNT_LIST_ALL,
            arguments: {ACCOUNT_ID: contactId})?.then((value) {
          if (value != null && value is ActivityAccount) {
            name.value = value.accountName ?? '';
            contactId = value.id;
          }
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectRole(int index) async {
    try {
      accountRelationTypeId = crmMasterData?.listAccountRelationType?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        if (accountContact?.id != null) {
          await onUpdated();
        } else {
          if (contactId == null) {
            await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'crm.account.contact.personal.required'.tr,
            );
            return;
          }
          if (type.value == CommonConstants.accountObjectTypeAccount &&
              account?.id == contactId) {
            await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'Không thể tự tạo mối quan hệ với chính mình'.tr,
            );
            return;
          }

          await onInsert();
        }
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onInsert() async {
    try {
      if (type.value == CommonConstants.accountObjectTypeContact) {
        await crmUIRepository
            .insertAccountContact(AccountContactRequest(
          accountId: account?.id.toString(),
          accountRelationTypeId: accountRelationTypeId,
          contactIds: [contactId ?? 0],
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
      } else {
        await crmUIRepository
            .insertAccountContactAccount(AccountContactAccountRequest(
          currentAccountId: account?.id.toString(),
          accountRelationTypeId: accountRelationTypeId,
          accountId: contactId,
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
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onUpdated() async {
    try {
      await crmUIRepository
          .updateAccountContact(
              accountContact?.id ?? 0,
              AccountContactRequest(
                accountRelationTypeId: accountRelationTypeId,
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
