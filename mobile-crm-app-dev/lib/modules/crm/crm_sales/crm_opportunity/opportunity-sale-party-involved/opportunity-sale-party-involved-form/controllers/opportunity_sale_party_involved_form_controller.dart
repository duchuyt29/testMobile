import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/authorization_group/authorization_group.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_sale_party_involved.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_party_involved_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class OpportunitySalePartyInvolvedFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  RxString type = ''.obs;
  RxString name = ''.obs;
  Opportunity? opportunity;
  OppSalePartyInvolved? opportunityPartyInvolved;

  int? indexRole;
  int? partyInvolvedPartnerFunctionId;
  int? employeeId;
  int? authorizationGroupId;
  final TextEditingController typeController = TextEditingController();

  OpportunitySalePartyInvolvedFormController() {
    final arguments = Get.arguments as Map;
    type.value = arguments[PARTY_INVOLVED_TYPE];
    opportunity = arguments[OPPORTUNITY_INFO].value;
    opportunityPartyInvolved = arguments[PARTY_INVOLVED];

    typeController.text = type.value == CommonConstants.subjectPersonal
        ? 'crm.contact.involve.personal'.tr
        : 'crm.contact.involve.users'.tr;

    if (opportunityPartyInvolved?.id != null) {
      name.value = opportunityPartyInvolved?.getEmployeeFullName() ?? '';
    }

    if (opportunityPartyInvolved?.partyInvolvedPartnerFunctionId != null) {
      indexRole = crmMasterData?.listPartyInvolvedPartnerFunction?.indexWhere(
          (e) =>
              e.id == opportunityPartyInvolved?.partyInvolvedPartnerFunctionId);
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> loadEmployee() async {
    try {
      if (type.value == CommonConstants.subjectPersonal) {
        await Get.toNamed(CRMRoutes.CRM_EMPLOYEE,
            arguments: {IS_MULTI_SELECT: false})?.then((value) {
          if (value != null && value is EmployeeModel) {
            name.value = value.getFullname();
            employeeId = value.id;
          }
        });
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
        if (opportunityPartyInvolved?.id != null) {
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
      if (employeeId == null && authorizationGroupId == null) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: 'crm.validation.form.empty.message'.tr);
        return;
      }
      await crmUIRepository
          .insertOpportunityPartyInvolved(OpportunityPartyInvolvedRequest(
        opportunityId: opportunity?.id.toString(),
        partyInvolvedPartnerFunctionId: partyInvolvedPartnerFunctionId,
        employeeId: employeeId,
        authorizationGroupId: authorizationGroupId,
        objectTypeId: 4,
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
          .updateOpportunityPartyInvolved(
              opportunityPartyInvolved?.id ?? 0,
              OpportunityPartyInvolvedRequest(
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
