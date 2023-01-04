import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_stage.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/lead/lead_model.dart';
import 'package:ui_api/crm_api/request/activity_request.dart';
import 'package:ui_api/crm_api/request/lead/lead_stage_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_crm_lead_stage_close.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_action.dart';

class CrmOverviewLeadController extends BaseController {
  final lead = Rxn<LeadModel>();
  final leadDetail = Rxn<LeadDetail>();

  ActivityRequest request = ActivityRequest();
  final listActivity = RxList<ActivityContent>();

  final indexLeadStage = RxInt(0);
  final isDone = RxBool(false);
  final stages = RxList<LeadStage>();

  /* Init */

  CrmOverviewLeadController() {
    lead.value = Get.arguments as LeadModel?;
    request = ActivityRequest.lead(lead.value?.id);

    // getActivities(0);
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await EasyLoading.show();
    await _callGetLeadDetail();

    await getActivities(0);
  }

  /* Action */

  Future<void> onMenuAction() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuAction(
        onAddActivity: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleActivity?.createTask !=
                null
            ? showCreateActivityModalBottomSheet
            : null,
        onConvertTap: (lead.value?.isConvert != 1 &&
                leadDetail.value?.leadStageId == LeadStage.leadDoneConvert)
            ? onConvertLead
            : null,
        onDeleteTap: lead.value?.isConvert == 1 ? null : onDeleteLead,
      ),
    );
  }

  Future<void> onConvertLead() async {
    await Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD, arguments: leadDetail.value)
        ?.then((value) {
      if (value != null && value) {
        _callGetLeadDetail();
      }
    });
  }

  Future<void> onDeleteLead() async {
    if (lead.value?.id == null) {
      await EasyLoading.showToast('Không được xóa khách hàng này!');
      return;
    }
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'Xóa Khách hàng tiềm năng',
      message:
          'Bạn có chắc chắn muốn xóa khách hàng tiềm năng? Khách hàng tiềm năng sẽ bị xóa vĩnh viễn.',
      confirmTitle: 'delete'.tr,
      onConfirm: () => _callDeleteLead(lead.value!.id!),
    );
  }

  Future<void> onPhoneAction() async {
    final phoneUri = Uri(scheme: 'tel', path: lead.value?.leadPhone ?? '');
    await EasyLoading.show();
    await canLaunchUrl(phoneUri).then((value) async {
      await EasyLoading.dismiss();
      if (value) {
        await launchUrl(phoneUri);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
    });
  }

  Future<void> onViewLeadDetail() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_DETAIL, arguments: leadDetail.value)
        ?.then((value) {
      if (value != null) {
        if (value is String) {
          Get.back(result: value);
        } else if (value is LeadDetail) {
          leadDetail.value = value;
          leadDetail.refresh();
          updateLeadStage();

          lead.value = value.getLead();
          lead.refresh();
        }
      }
    });
  }

  Future<void> onRelevantPersonal() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_DETAIL_RELEVANT_PERSONAL,
        arguments: lead.value);
  }

  Future<void> onViewDocument() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_DOCUMENT);
  }

  Future<void> onViewNote() async {}

  Future<void> onViewProductInterest() async {
    await Get.toNamed(
      CRMRoutes.CRM_LEAD_PRODUCTS,
      arguments: leadDetail.value,
    );
  }

  Future onLeadStageIndex(int index) async {
    indexLeadStage.value = index;
  }

  Future onUpdateStage() async {
    final stage = stages[indexLeadStage.value];
    if (stage.subLeadStages?.isEmpty ?? true) {
      await _callUpdateLeadStage(stage);
    } else {
      await BottomSheetUtil.createBottomSheet(
        title: 'Đóng khách hàng tiềm năng',
        child: WidgetCrmLeadStageClose(
          leadStages: stage.subLeadStages!,
          currentLeadStage: stage,
          onSaveLeadStage: (leadStage) async {
            if (leadStage != null) {
              await _callUpdateLeadStage(leadStage);
            }
          },
        ),
      );
    }
  }

  /* Call API */

  Future<void> _callGetLeadDetail() async {
    await crmUIRepository
        .getLeadDetail(lead.value?.id ?? -1)
        .then((response) async {
      if (response.success) {
        leadDetail.value = response.data;
        updateLeadStage();

        if (leadDetail.value?.leadStageId != null) {
          await _getLeadStageReason(leadDetail.value!.leadStageId!);
        }
        await EasyLoading.dismiss();
      } else {
        await EasyLoading.dismiss();
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

  Future<void> _callUpdateLeadStage(LeadStage leadStage) async {
    await EasyLoading.show();

    await crmUIRepository
        .updateLeadStage(
            lead.value?.id ?? -1,
            LeadStageRequest(
                leadStageId: leadStage.id,
                leadStageReasonId: leadStage.leadStageReason?.id))
        .then((response) async {
      if (response.success) {
        leadStage.leadStageReason = null;
        await _callGetLeadDetail();
      } else {
        await EasyLoading.dismiss();
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

  // Lấy DS lý do từ chối ứng với mỗi trạng thái KHTN, bỏ qua nếu đã lấy
  Future<void> _getLeadStageReason(int leadStageId) async {
    if (AppDataGlobal.leadStageReasons[leadStageId] != null) {
      return;
    }

    await crmUIRepository.leadStageReason(leadStageId).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.leadStageReasons[leadStageId] = response.data ?? [];
      } else {
        printError(
            info: 'Get lead reason close not convert ${response.message}');
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: 'Get lead reason close not convert $onError');
    });
  }

  Future<void> getActivities(int page) async {
    // await EasyLoading.show();
    await crmUIRepository
        .getActivities(page, CommonConstants.defaultSize,
            CommonConstants.sortCreateDateDesc, request)
        .then((response) async {
      if (response.success) {
        if (page == 0) {
          listActivity.clear();
        }

        final activityContents = response.data?.content ?? [];
        await Future.forEach(activityContents,
            (ActivityContent activity) async {
          listActivity.add(activity);
        });

        // await EasyLoading.dismiss();
      } else {
        // await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      // EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> _callDeleteLead(int id) async {
    await EasyLoading.show();
    await crmUIRepository.deleteLead(id).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        Get.back(result: 'Xóa thành công!');
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  /* Function */

  // Cập nhật lại DS trạng thái của KHTN
  void updateLeadStage() {
    final currentStage = leadDetail.value?.getLeadStage();
    stages.value = LeadStage.getLeadStages();
    if (currentStage != null) {
      indexLeadStage.value = stages.indexWhere((stage) {
        if (stage.subLeadStages?.isNotEmpty ?? false) {
          return stage.subLeadStages!.any((element) {
            if (element.id == currentStage.id) {
              stage.id = element.id;
              stage.leadStageName = element.leadStageName;
              return true;
            } else {
              return false;
            }
          });
        } else if (stage.id == currentStage.id) {
          return true;
        }
        return false;
      });
      indexLeadStage.value =
          indexLeadStage.value == -1 ? 0 : indexLeadStage.value;
      isDone.value = (stages[indexLeadStage.value].id ?? 1) >= 3;
    }
    stages.refresh();
  }

  Future<void> showCreateActivityModalBottomSheet() async {
    await Get.bottomSheet(
      Wrap(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text('crm.create.choose_type'.tr,
                  style: AppTextStyle.bold(fontSize: 20)),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_job'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB,
                  arguments: {
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail.value
                  })?.then((value) {
                if (value != null && value) {
                  getActivities(0);
                }
              }),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_call'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_CALL,
                  arguments: {
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail.value
                  })?.then((value) {
                if (value != null && value) {
                  getActivities(0);
                }
              }),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_email'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_EMAIL,
                  arguments: {
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail.value
                  })?.then((value) {
                if (value != null && value) {
                  getActivities(0);
                }
              }),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_meeting'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(
                  CRMRoutes.CRM_ACTIVITY_ADD_FORM_APPOINTMENT,
                  arguments: {
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail.value
                  })?.then((value) {
                if (value != null && value) {
                  getActivities(0);
                }
              }),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: Get.back,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('crm_discard'.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.heavy(color: Colors.blue.shade700)),
              ),
            ),
          ],
        ),
      ]),
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  /* Function */

  String getStageTitle() {
    if (stages.length > indexLeadStage.value) {
      return '${'crm.opportunity.stage'.tr}: ${stages[indexLeadStage.value].leadStageName ?? ''}';
    }
    return '';
  }
}
