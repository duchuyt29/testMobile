import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/authorization_group/authorization_group.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/lead/lead_model.dart';
import 'package:ui_api/crm_api/models/lead/lead_party_involved.dart';
import 'package:ui_api/crm_api/request/lead/lead_party_involved_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmCreateDetailLeadSalePartyInvolesController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  RxString type = ''.obs;
  RxString name = ''.obs;
  LeadModel? lead;
  LeadPartyInvolved? leadPartyInvolved;
  int? indexRole;
  int? partyInvolvedPartnerFunctionId;
  int? employeeId;
  int? authorizationGroupId;
  final TextEditingController typeController = TextEditingController();

  CrmCreateDetailLeadSalePartyInvolesController() {
    final arguments = Get.arguments as Map;
    type.value = arguments[PARTY_INVOLVED_TYPE];
    lead = arguments[LEAD_MODEL];
    leadPartyInvolved = arguments[PARTY_INVOLVED];

    typeController.text = type.value == CommonConstants.subjectPersonal
        ? 'crm.contact.involve.personal'.tr
        : 'crm.contact.involve.users'.tr;
    if (leadPartyInvolved?.id != null) {
      name.value = leadPartyInvolved?.getEmplpoyee()?.getFullname() ?? '';
    }

    if (leadPartyInvolved?.partyInvolvedPartnerFunctionId != null) {
      indexRole = crmMasterData?.listPartyInvolvedPartnerFunction?.indexWhere(
          (e) => e.id == leadPartyInvolved?.partyInvolvedPartnerFunctionId);
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

  Future<void> selectRole(int index) async {
    try {
      partyInvolvedPartnerFunctionId =
          crmMasterData?.listPartyInvolvedPartnerFunction?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        if (leadPartyInvolved?.id != null) {
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
          .insertLeadPartyInvolved(LeadPartyInvolvedRequest(
        leadId: lead?.id.toString(),
        partyInvolvedPartnerFunctionId: partyInvolvedPartnerFunctionId,
        objectTypeId: 3,
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
          .updateLeadPartyInvolved(
              leadPartyInvolved?.id ?? 0,
              LeadPartyInvolvedRequest(
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
