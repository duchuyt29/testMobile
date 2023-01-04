import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/currency_exchange_rate.dart';
import 'package:ui_api/crm_api/models/employee/employee_info.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_account.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_request.dart';
import 'package:ui_api/crm_api/response/opporunity/opportunity_stage_reason_response.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class OpportunityFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  Rx<OpportunityInfo> opportunityInfo = Rx<OpportunityInfo>(OpportunityInfo());
  Rx<EmployeeInfo> employInfo = Rx<EmployeeInfo>(EmployeeInfo());
  final opportunityRequest = OpportunityRequest();
  @override
  final crmMasterData = AppDataGlobal.crmMasterData;
  final selectedAccount = RxList<OppAccount>();

  RxList<OpportunityStageReason> stageReasons =
      RxList<OpportunityStageReason>();

  OpportunityFormController() {
    employInfo.value = AppDataGlobal.userInfo?.employeeInfo ?? EmployeeInfo();
    if (Get.arguments != null) {
      opportunityInfo.value = Get.arguments;
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    opportunityRequest.startDate = DateUtil.formatDatetimeToString(
        DateTime.now(),
        type: DateUtil.API_TYPE);
  }

  void onChangeCurrencyExchangeRate(int? currencyExchangeRateId) {
    if (currencyExchangeRateId != null) {
      fbKey.currentState!.fields['amount']!.didChange(
          '0 ${crmMasterData!.listCurrencyExchangeRate!.firstWhere((element) => element.id == currencyExchangeRateId).currencyCode!}');
    }
  }

  Future<void> onChangeStage(int? stageId) async {
    try {
      if (stageId != null) {
        if (stageId == 7) {
          await EasyLoading.show(status: 'loading...');
          await getStageReason(stageId);
          await EasyLoading.dismiss();
        } else {
          stageReasons.clear();
          fbKey.currentState!.fields['stageReasonId']!.didChange(null);
        }
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future onAccount() async {
    await Get.toNamed(CRMRoutes.CRM_SELECT_ACCOUNT,
            arguments: {IS_MULTI_SELECT: false, LIST_SELECTED: selectedAccount})
        ?.then((value) {
      if (value != null && value is OppAccount) {
        selectedAccount.clear();
        selectedAccount.add(value);
        fbKey.currentState!.fields['accountId']!.didChange(value.accountName);
        opportunityRequest.accountId = value.id;
      }
    });
  }

  Future<void> onCurrency() async {
    await Get.toNamed(CRMRoutes.ALL_CURRENCY_EXCHANGE_RATE,
            arguments: opportunityRequest.currencyExchangeRateId)
        ?.then((value) {
      if (value != null && value is CurrencyExchangeRate) {
        opportunityRequest.currencyExchangeRateId = value.id;
        fbKey.currentState!.fields['currencyExchangeRateId']!
            .didChange(value.currencyName);
        fbKey.currentState!.fields['amount']!
            .didChange('0 ${value.currencyCode}');
      }
    });
  }

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        final data = fbKey.currentState!.value;
        opportunityRequest.employeeId = employInfo.value.id;
        opportunityRequest.opportunityName = data['opportunityName'];
        opportunityRequest.description = data['description'];
        opportunityRequest.stageId = data['stageId'];
        opportunityRequest.stageReasonId = data['stageReasonId'];
        opportunityRequest.typeId = data['typeId'];
        opportunityRequest.leadSourceId = data['leadSourceId'];
        opportunityRequest.probability = data['probability'] != null
            ? double.parse(data['probability']) / 100
            : 0;

        await createOpportunity();
      } else {
        await DialogUtil.createDialogMessage(
            message: 'Vui lòng nhập đầy đủ thông tin');
      }
    } catch (e) {
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    }
  }

  // API

  // Lấy danh sách lý đóng cơ hội bán hàng
  Future<void> getStageReason(int opportunityStageId) async {
    try {
      await EasyLoading.show();
      stageReasons.clear();
      final data =
          await crmUIRepository.getOpportunityStageReason(opportunityStageId);
      stageReasons.value = data.data ?? [];
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    }
  }

  Future<void> createOpportunity() async {
    try {
      await EasyLoading.show();
      await crmUIRepository.postNewOpportunity(opportunityRequest);
      Get.back(
        result: true,
      );
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    }
  }

  Future<void> selectDate(String field, bool isStartDate) async {
    final date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      // styles
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      // select hour
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((date) {
      if (date == null) {
        if (!isStartDate) {
          opportunityRequest.closeDate = null;
          fbKey.currentState!.fields['closeDate']!.didChange(null);
        }
        return;
      }
      final temp = DateTime(date.year, date.month, date.day, 0);

      fbKey.currentState?.fields[field]?.didChange(
          '${date.day ?? ''}/${date.month ?? ''}/${date.year ?? ''}');

      if (isStartDate) {
        opportunityRequest.startDate = DateUtil.formatDatetimeToString(
            temp.toUtc(),
            type: DateUtil.API_TYPE);
      } else {
        opportunityRequest.closeDate = DateUtil.formatDatetimeToString(
            temp.toUtc(),
            type: DateUtil.API_TYPE);
      }
    }).catchError(print);
    // fbKey.currentState!.fields[field]!.didChange(date);
  }

  String? validateCloseDate(String val) {
    if (val.isNotEmpty) {
      final startDate = fbKey.currentState?.fields['startDate']?.value;
      final closeDate = fbKey.currentState?.fields['closeDate']?.value;
      if (startDate != null &&
          startDate.isNotEmpty &&
          closeDate != null &&
          closeDate.isNotEmpty) {
        final startDateValue = DateFormat('dd/MM/yyyy').parse(startDate);
        final closeDateValue = DateFormat('dd/MM/yyyy').parse(closeDate);
        if (startDateValue.isAfter(closeDateValue)) {
          return 'crm.opportunity.validate.date'.tr;
        }
      }
      final today = DateTime.now();
      final closeDateValue = DateFormat('dd/MM/yyyy').parse(closeDate);
      if (today.isAfter(closeDateValue)) {
        return 'crm.opportunity.validate.date'.tr;
      }
    }
    return null;
  }
}
