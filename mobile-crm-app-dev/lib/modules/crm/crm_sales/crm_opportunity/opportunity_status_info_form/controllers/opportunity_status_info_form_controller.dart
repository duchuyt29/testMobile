import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_status_request.dart';
import 'package:ui_api/crm_api/response/opporunity/opportunity_stage_reason_response.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class OpportunityStatusInfoFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  final opportunityInfo = Rxn<OpportunityInfo>();
  final opportunityStatusRequest = OpportunityStatusRequest();

  RxList<OpportunityStageReason> stageReasons =
      RxList<OpportunityStageReason>();

  @override
  final crmMasterData = AppDataGlobal.crmMasterData;

  OpportunityStatusInfoFormController() {
    if (Get.arguments != null) {
      opportunityInfo.value = Get.arguments;
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    opportunityStatusRequest.startDate = DateUtil.formatDatetimeToString(
        opportunityInfo.value?.startDate,
        type: DateUtil.API_TYPE);
    opportunityStatusRequest.closeDate = DateUtil.formatDatetimeToString(
        opportunityInfo.value?.closeDate,
        type: DateUtil.API_TYPE);
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

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        final data = fbKey.currentState!.value;
        opportunityInfo.value?.currencyExchangeRateId;
        opportunityStatusRequest.id = opportunityInfo.value?.id;
        opportunityStatusRequest.stageReasonId = data['stageReasonId'];
        opportunityStatusRequest.stageId = data['stageId'];

        await updateOpportunity();
      }
    } catch (e) {
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: e.toString());
    }
  }

  // API
  Future<void> updateOpportunity() async {
    try {
      await EasyLoading.show();
      await crmUIRepository.updateOpportunityStatus(opportunityStatusRequest);
      Get.back(
        result: true,
      );
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: e.toString());
    }
  }

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
        return;
      }
      final temp = DateTime(date.year, date.month, date.day, 0);

      fbKey.currentState?.fields[field]?.didChange(
          '${date.day ?? ''}/${date.month ?? ''}/${date.year ?? ''}');

      if (isStartDate) {
        opportunityStatusRequest.startDate = DateUtil.formatDatetimeToString(
            temp.toUtc(),
            type: DateUtil.API_TYPE);
      } else {
        opportunityStatusRequest.closeDate = DateUtil.formatDatetimeToString(
            temp.toUtc(),
            type: DateUtil.API_TYPE);
      }
    }).catchError(print);
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
