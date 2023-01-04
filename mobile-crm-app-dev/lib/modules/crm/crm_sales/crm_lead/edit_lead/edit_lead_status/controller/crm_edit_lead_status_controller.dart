import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_stage.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/lead/lead_stage_reason.dart';
import 'package:ui_api/crm_api/request/lead/lead_status_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/date_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_single_selection.dart';

class CrmEditLeadStatusController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  LeadDetail? leadDetail;

  int? indexLeadStage;
  final isDone = RxBool(false);

  final isRequiredLeadStageReason = RxBool(false);
  final selcetedLeadStageReason = Rxn<LeadStageReason>();

  int? indexPotenitalLevel;

  final employeeInChargeController = TextEditingController();
  final startDateController = TextEditingController();
  DateTime startDate = DateTime.now();

  /* Init */

  CrmEditLeadStatusController() {
    leadDetail = Get.arguments as LeadDetail?;

    if (leadDetail?.leadStageId != null) {
      _callGetLeadStageReason(leadDetail!.leadStageId!);

      indexLeadStage = crmMasterData?.listLeadStage
          ?.indexWhere((element) => element.id == leadDetail?.leadStageId);
      if (indexLeadStage == -1) {
        indexLeadStage = null;
      } else {
        isDone.value =
            (crmMasterData?.listLeadStage?[indexLeadStage!].id ?? 0) >= 3;
      }
      selcetedLeadStageReason.value = leadDetail?.getLeadStageReason();
    }

    indexPotenitalLevel = crmMasterData?.listLeadPotentialLevel?.indexWhere(
        (element) => element.id == leadDetail?.leadPotentialLevelId);
    if (indexPotenitalLevel == -1) {
      indexPotenitalLevel = null;
    }

    startDate = leadDetail?.startDate ?? DateTime.now();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (leadDetail == null) {
      Get.back();
    }

    employeeInChargeController.text =
        leadDetail?.getEmplpoyee()?.getFullname() ?? '';
    startDateController.text =
        DateUtil.formatDatetimeToString(startDate.toUtc());
  }

  /* Action */

  Future onSelectedLeadStatus(int index) async {
    indexLeadStage = index;
    final leadStage = crmMasterData?.listLeadStage?[index];
    await _callGetLeadStageReason(leadStage?.id ?? 0);
  }

  Future onSelectedPotenitalLevel(int index) async {
    indexPotenitalLevel = index;
  }

  Future selectStartDate() async {
    await showDatePicker(
      context: Get.context!,
      initialDate: startDate.toLocal(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((date) {
      if (date == null) {
        return;
      }
      startDate = date;
      startDateController.text = DateUtil.formatDatetimeToString(date.toUtc());
    });
  }

  Future onChangeLeadStageReason() async {
    final leadStage = indexLeadStage == null
        ? null
        : crmMasterData?.listLeadStage?[indexLeadStage!];
    if (leadStage == null) {
      return;
    }
    final leadStageReasons = AppDataGlobal.leadStageReasons[leadStage.id] ?? [];
    if (leadStageReasons.isEmpty) {
      return;
    }
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.lead.refusal.reason'.tr,
      child: WidgetSingleSelection<LeadStageReason>(
        items: leadStageReasons
            .map((e) => SingleSelectionItem(e, e.leadStageReasonName ?? ''))
            .toList(),
        initialValue: selcetedLeadStageReason.value,
        onSelectionChanged: (leadStageReason) {
          selcetedLeadStageReason.value = leadStageReason;
        },
      ),
    );
  }

  Future onUpdate() async {
    if (fbKey.currentState!.saveAndValidate()) {
      await _callUpdateLead();
    } else {
      await EasyLoading.showToast(
          'Chưa điền đủ thông tin để cập nhật thông tin khách hàng tiềm năng!');
    }
  }

  void onCancel() => Get.back();

  /* Call API */

  Future<void> _callUpdateLead() async {
    final leadStatusRequest = LeadStatusRequest(id: leadDetail?.id);
    leadStatusRequest.leadStageId = indexLeadStage == null
        ? null
        : crmMasterData?.listLeadStage?[indexLeadStage!].id;

    leadStatusRequest.leadPotentialLevelId = indexPotenitalLevel == null
        ? null
        : crmMasterData?.listLeadPotentialLevel?[indexPotenitalLevel!].id;

    leadStatusRequest.startDate = startDate;
    leadStatusRequest.leadStageReasonId = selcetedLeadStageReason.value?.id;

    await EasyLoading.show();
    await crmUIRepository
        .updateLeadStatus(leadStatusRequest)
        .then((response) async {
      if (response.success) {
        await _callGetLeadDetail();
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callGetLeadDetail() async {
    await crmUIRepository
        .getLeadDetail(leadDetail?.id ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        leadDetail = response.data;
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'Cập nhật khách hàng tiềm năng thành công!',
          onPressed: () => Get.back(result: leadDetail),
        );
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future _callGetLeadStageReason(int id) async {
    isRequiredLeadStageReason.value = id == LeadStage.leadDoneNotConvert;
    if (AppDataGlobal.leadStageReasons[id] != null) {
      return;
    }

    await EasyLoading.show();
    await crmUIRepository.leadStageReason(id).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.leadStageReasons[id] = response.data ?? [];
      } else {
        await EasyLoading.showToast(response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: 'Get lead reason close not convert $onError');
      EasyLoading.showToast('notify.error'.tr);
    });
  }
}
