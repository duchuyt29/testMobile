import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/lead/lead_stage_reason.dart';
import 'package:ui_api/crm_api/request/lead/lead_additional_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmEditLeadAdditionInfoController extends BaseController {
  LeadDetail? leadDetail;

  final selcetedLeadStageReason = Rxn<LeadStageReason>();
  final descriptionController = TextEditingController();

  /* Init */

  CrmEditLeadAdditionInfoController() {
    leadDetail = Get.arguments as LeadDetail?;
    selcetedLeadStageReason.value = leadDetail?.getLeadStageReason();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (leadDetail == null) {
      Get.back();
    }

    descriptionController.text = leadDetail?.description ?? '';
  }

  /* Action */
  Future onUpdate() async => _callUpdateLead();

  // Future onChangeLeadStageReason() async {
  //   final leadStageReasons =
  //       AppDataGlobal.leadStageReasons[leadDetail?.leadStageId] ?? [];
  //   if (leadStageReasons.isEmpty) {
  //     return;
  //   }
  //   return BottomSheetUtil.createBottomSheet(
  //     title: 'crm.lead.refusal.reason'.tr,
  //     child: WidgetSingleSelection<LeadStageReason>(
  //       items: leadStageReasons
  //           .map((e) => SingleSelectionItem(e, e.leadStageReasonName ?? ''))
  //           .toList(),
  //       initialValue: selcetedLeadStageReason.value,
  //       onSelectionChanged: (leadStageReason) {
  //         selcetedLeadStageReason.value = leadStageReason;
  //       },
  //     ),
  //   );
  // }

  void onCancel() => Get.back();

  /* Call API */

  Future<void> _callUpdateLead() async {
    final leadAddressRequest = LeadAdditionalRequest(id: leadDetail?.id);
    leadAddressRequest.description = leadDetail?.description ?? '';
    leadAddressRequest.leadStageReasonId = selcetedLeadStageReason.value?.id;

    await EasyLoading.show();
    await crmUIRepository
        .updateLeadAdditional(leadAddressRequest)
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
}
