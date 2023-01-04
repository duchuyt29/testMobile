import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_party_involved.dart';
import 'package:ui_api/crm_api/models/authorization_group/authorization_group.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/party_involved_partner_function.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/request/account/account_party_involved_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_single_selection.dart';

class CrmAddRelevantPersonalController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  RxString type = ''.obs;
  RxString name = ''.obs;
  Account? account;
  AccountPartyInvolved? accountPartyInvolved;
  List<PartyInvolvedPartnerFunction> partyInvolvedPartnerFunctions =
      AppDataGlobal.crmMasterData?.listPartyInvolvedPartnerFunction! ?? [];
  final selectedType = Rxn<PartyInvolvedPartnerFunction>();

  int? indexRole;
  int? partyInvolvedPartnerFunctionId;
  int? employeeId;
  int? authorizationGroupId;
  final TextEditingController typeController = TextEditingController();

  CrmAddRelevantPersonalController() {
    final arguments = Get.arguments as Map;
    type.value = arguments[PARTY_INVOLVED_TYPE];
    account = arguments[ACCOUNT_INFO];
    accountPartyInvolved = arguments[PARTY_INVOLVED];

    if (accountPartyInvolved != null) {
      employeeId = accountPartyInvolved?.employeeId ?? 0;
      partyInvolvedPartnerFunctionId =
          accountPartyInvolved?.partyInvolvedPartnerFunctionId ?? 0;
    }

    typeController.text = type.value == CommonConstants.subjectPersonal
        ? 'crm.contact.involve.personal'.tr
        : 'crm.contact.involve.users'.tr;

    if (accountPartyInvolved?.id != null) {
      name.value = accountPartyInvolved?.getEmployeeFullName() ?? '';
    }

    if (accountPartyInvolved?.partyInvolvedPartnerFunctionId != null &&
        accountPartyInvolved?.partyInvolvedPartnerFunctionId != 0) {
      indexRole = crmMasterData?.listPartyInvolvedPartnerFunction?.indexWhere(
          (e) => e.id == accountPartyInvolved?.partyInvolvedPartnerFunctionId);
      selectedType.value = partyInvolvedPartnerFunctions[indexRole ?? 0];
    }
  }

  Future<void> loadEmployee() async {
    try {
      if (type.value == CommonConstants.subjectPersonal) {
        await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
          IS_MULTI_SELECT: false,
        })?.then(
          (value) {
            if (value != null && value is EmployeeModel) {
              name.value = value.getFullname();
              employeeId = value.id;
            }
          },
        );
      } else {
        await Get.toNamed(CRMRoutes.CRM_AUTHORIZATION_GROUP,
            arguments: {AUTHORIZATION_GROUP_ID: 0})?.then(
          (value) {
            if (value != null && value is AuthorizationGroup) {
              name.value = value.authorizationGroupName ?? '';
              authorizationGroupId = value.id;
            }
          },
        );
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectRole() async {
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.account.personal.role'.tr,
      child: WidgetSingleSelection<PartyInvolvedPartnerFunction>(
        items: partyInvolvedPartnerFunctions
            .map((e) => SingleSelectionItem(
                e, e.partyInvolvedPartnerFunctionName ?? ''))
            .toList(),
        initialValue: selectedType.value,
        onSelectionChanged: (documentType) {
          selectedType.value = documentType;
          partyInvolvedPartnerFunctionId = documentType.id;
        },
      ),
    );
  }

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        if (accountPartyInvolved?.id != null) {
          await onUpdated();
        } else {
          await onInsert();
        }
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onInsert() async {
    try {
      await crmUIRepository
          .insertAccountPartyInvolved(AccountPartyInvolvedRequest(
        accountId: account?.id.toString(),
        partyInvolvedPartnerFunctionId: partyInvolvedPartnerFunctionId,
        employeeId: employeeId,
        authorizationGroupId: authorizationGroupId,
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

  Future<void> onUpdated() async {
    try {
      await crmUIRepository
          .updateAccountPartyInvolved(
              accountPartyInvolved?.id ?? 0,
              AccountPartyInvolvedRequest(
                partyInvolvedPartnerFunctionId: partyInvolvedPartnerFunctionId,
                ownerEmployeeId: employeeId,
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
