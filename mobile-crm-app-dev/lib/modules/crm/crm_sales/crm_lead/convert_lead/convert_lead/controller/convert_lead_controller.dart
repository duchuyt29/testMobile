import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account_contact.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/request/lead/lead_convert_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/utils/date_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class ConvertLeadController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  final startDateController = TextEditingController();
  final nameController = TextEditingController();

  final leadDetail = Rxn<LeadDetail>();
  final leadConvertRequest = Rx<LeadConvertRequest>(LeadConvertRequest());

  // Chọn khách hàng đã có
  final activityAccount = Rxn<ActivityAccount>();

  int indexOpportunity = 0;
  int? indexCurrency;

  final employeeInCharge = Rxn<EmployeeModel>();
  final accountContact = Rxn<AccountContact>();

  /* Init */

  ConvertLeadController() {
    leadDetail.value = Get.arguments as LeadDetail?;
    leadConvertRequest.value = LeadConvertRequest(
      leadId: leadDetail.value?.id,
      startDate: DateTime.now(),
    );
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    startDateController.text = DateUtil.formatDatetimeToString(
        leadConvertRequest.value.startDate?.toUtc() ?? DateTime.now());

    employeeInCharge.value = AppDataGlobal.employees.firstWhere(
        (element) => element.id == AppDataGlobal.userInfo?.employeeInfo?.id);
  }

  /* Action */

  Future<void> onSearchAccount() async {
    await Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD_SEARCH_ACCOUNT, arguments: {
      LEAD_DETAIL: leadDetail.value,
      LEAD_CONVERT_REQUEST: leadConvertRequest.value,
    })?.then((value) {
      if (value != null && value is LeadConvertRequest) {
        activityAccount.value = null;
        leadConvertRequest.value = value;
        leadConvertRequest.refresh();
      } else if (value != null && value is ActivityAccount) {
        activityAccount.value = value;
        activityAccount.refresh();
      }
    });
  }

  Future onSelectStartDate() async {
    await showDatePicker(
      context: Get.context!,
      initialDate:
          leadConvertRequest.value.startDate?.toLocal() ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((date) {
      if (date == null) {
        return;
      }
      leadConvertRequest.value.startDate = date;
      startDateController.text = DateUtil.formatDatetimeToString(date.toUtc());
    });
  }

  Future onSelectedOpportunity(int index) async {
    indexOpportunity = index;
  }

  Future onSelectedCurrency(int index) async {
    indexCurrency = index;
  }

  Future onSearchContact() async {
    await Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD_SEARCH_CONTACT);
  }

  Future onEmployeeInCharge() async {
    await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
      IS_MULTI_SELECT: false,
    })?.then(
      (value) {
        if (value != null && value is EmployeeModel) {
          employeeInCharge.value = value;
        }
      },
    );
  }

  Future onAccountContact() async {
    await Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD_SEARCH_CONTACT)?.then((value) {
      if (value != null && value is AccountContact) {
        accountContact.value = value;
      }
    });
  }

  Future<void> onCancel() async => Get.back();

  Future<void> onSave() async {
    if (fbKey.currentState!.saveAndValidate()) {
      if (activityAccount.value != null) {
        leadConvertRequest.value.accountId = activityAccount.value?.id;
        leadConvertRequest.value.accountTypeId = null;
        leadConvertRequest.value.accountName = null;
        leadConvertRequest.value.accountPhone = null;
        leadConvertRequest.value.documentTypeId = null;
        leadConvertRequest.value.documentNumber = null;
      } else {
        leadConvertRequest.value.accountId = null;
      }
      await _callLeadConvert();
    } else {
      await EasyLoading.showToast('Chưa điền đủ thông tin để chuyển đổi!');
    }
  }

  /* Call API */

  Future<void> _callLeadConvert() async {
    try {
      await crmUIRepository
          .leadConvert(leadConvertRequest.value)
          .then((response) async {
        if (response.success) {
          await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: 'Chuyển đổi khách hàng tiềm năng thành công!',
            onPressed: () => Get.back(result: true),
          );
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
