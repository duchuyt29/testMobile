import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_condition.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/opportunity_stage.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/request/activity_request.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_stage_request.dart';
import 'package:ui_api/crm_api/response/opporunity/opportunity_stage_reason_response.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_crm_selection_opp_stage.dart';

class CrmOpportunityDetailController extends BaseController {
  final listActivity = RxList<ActivityContent>([]);

  ActivityRequest request = ActivityRequest();

  OpportunityStageRequest stageRequest = OpportunityStageRequest();

  RxList<OpportunityStageReason> stageReasons =
      RxList<OpportunityStageReason>();

  Rx<Opportunity> opportunity = Rx<Opportunity>(Opportunity());
  final opportunityInfo = Rxn<OpportunityInfo>();
  final indexStage = RxInt(0);
  final stages = RxList<OpportunityStage>([
    OpportunityStage(
        id: 1, opportunityStageName: 'crm.opportunity.stage.unknown'.tr),
    OpportunityStage(
        id: 2, opportunityStageName: 'crm.opportunity.stage.rate'.tr),
    OpportunityStage(
        id: 3, opportunityStageName: 'crm.opportunity.stage.analysis'.tr),
    OpportunityStage(
        id: 4, opportunityStageName: 'crm.opportunity.stage.proposal'.tr),
    OpportunityStage(
        id: 5, opportunityStageName: 'crm.opportunity.stage.negotiation'.tr),
    OpportunityStage(
        id: 6,
        opportunityStageName: 'crm.opportunity.stage.closed'.tr,
        subOpportunityStages: [
          OpportunityStage(
              id: 6, opportunityStageName: 'crm.opportunity.stage.won'.tr),
          OpportunityStage(
              id: 7, opportunityStageName: 'crm.opportunity.stage.lost'.tr),
        ]),
  ]);

  CrmOpportunityDetailController() {
    opportunity.value = Get.arguments as Opportunity;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadData();
    updateOppStage();

    request = ActivityRequest(
        checkActivityTask: false,
        checkPermission: false,
        conditions: [
          ActivityCondition(
            logicOperator: '',
            conditionType: 'GROUP',
            filterType: 'ROLE',
            children: [
              ActivityCondition(
                conditionType: 'RULE',
                fieldName: 'opportunity_id',
                fieldType: 'LONG',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [opportunity.value.id ?? 0],
              ),
              ActivityCondition(
                conditionType: 'RULE',
                fieldName: 'requested_by',
                fieldType: 'STRING',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [
                  AppDataGlobal.userInfo != null
                      ? AppDataGlobal.userInfo!.id
                      : ''
                ],
              ),
              ActivityCondition(
                conditionType: 'RULE',
                fieldName: 'object_type_id',
                fieldType: 'STRING',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [TaskObjectType.OPP_OBJECT.id],
              ),
            ],
          ),
        ],
        include: [
          'next-states',
          'involves'
        ],
        props: [
          'id',
          'name',
          'contactId',
          'deadline',
          'closed_on',
          'responsibleId',
          'create_by',
          'create_date',
          'start_date',
          'state',
          'priorityId',
          'activityTypeId',
          'description',
          'objectTypeId',
          'accountId',
          'leadId',
          'opportunityId',
          'quoteId',
          'contractId',
          'orderId'
        ]);
    if (AppDataGlobal.userConfig?.menuActions
            ?.crmServiceSaleManagementSaleActivity?.viewTask !=
        null) {
      await getActivities(0, request);
    }
  }

  // Actions

  Future<void> onViewDetail() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_DETAIL_INFO,
            arguments: opportunity.value)
        ?.then((value) async {
      await _loadData();
      updateOppStage();
    });
  }

  Future<void> onViewSalePartyInvolved() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_SALE_PARTY_INVOLVED,
        arguments: opportunityInfo.value);
  }

  Future<void> onViewProduct() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_PRODUCT,
            arguments: opportunityInfo.value)!
        .then((value) => {_loadData()});
  }

  Future<void> showDeleteModalBottomSheet(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.opportunity.delete.title'.tr,
      message: 'crm.opportunity.delete.message'.tr,
      confirmTitle: 'crm.delete'.tr,
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }

  void updateOppStage() {
    final currentStage = opportunityInfo.value?.opportunityStageId;
    if (currentStage != null) {
      final index = stages.indexWhere((element) => element.id == currentStage);
      if (currentStage == 6 || currentStage == 7) {
        indexStage.value = 5;
      } else {
        indexStage.value = index;
      }
    }
  }

  Future<void> getActivities(int page, ActivityRequest request) async {
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

  Future onOppStageIndex(int index) async {
    indexStage.value = index;
    if (index != 5) {
      stageRequest.opportunityStageId = indexStage.value + 1;
    }
  }

  Future onUpdateOppStage() async {
    final currentStage = stages[indexStage.value];
    if (currentStage.subOpportunityStages?.isEmpty ?? true) {
      await updateOpportunityStage();
    } else {
      // modal bottom sheet select sub stage here
      await BottomSheetUtil.createBottomSheet(
          title: 'crm.opportunity.stage.select.closed'.tr,
          child: WidgetCrmOppDoneStage(
              opportunityStages: currentStage.subOpportunityStages ?? [],
              currentOpportunityStage: OpportunityStage(
                  id: opportunityInfo.value?.opportunityStageId,
                  opportunityStageName: currentStage.opportunityStageName,
                  oppStageReason: OpportunityStageReason(
                      id: stageRequest.opportunityStageReasonId,
                      opportunityStageReasonName: currentStage
                          .oppStageReason?.opportunityStageReasonName)),
              onSaveOpportunityStage: (oppStage) async {
                if (oppStage != null) {
                  stageRequest.opportunityStageId = oppStage.id;
                  stageRequest.opportunityStageReasonId =
                      oppStage.oppStageReason?.id;
                  await updateOpportunityStage();
                }
              }));
    }
  }

  // API
  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getOpportunityDetail(opportunity.value.id ?? 0)
          .then((response) async {
        if (response.success && response.data != null) {
          opportunityInfo.value = response.data!;
          await EasyLoading.dismiss();
        } else {
          await EasyLoading.dismiss();
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

  // Delete Opportunity
  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteOpportunityById(id).then((response) async {
        if (response.success) {
          Get.back(result: true);
        } else {
          await EasyLoading.dismiss();
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

  // Update opportunity stage
  Future<void> updateOpportunityStage() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .updateOpportunityStage(opportunity.value.id ?? 0, stageRequest)
          .then((response) async {
        if (response.success) {
          await EasyLoading.dismiss();
          await _loadData();
          updateOppStage();
        } else {
          await EasyLoading.dismiss();
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
                    'type': TaskObjectType.OPP_OBJECT,
                    'data': opportunity.value
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0, request);
                  }
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
                    'type': TaskObjectType.OPP_OBJECT,
                    'data': opportunity.value
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0, request);
                  }
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
                    'type': TaskObjectType.OPP_OBJECT,
                    'data': opportunity.value
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0, request);
                  }
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
                    'type': TaskObjectType.OPP_OBJECT,
                    'data': opportunity.value
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0, request);
                  }
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
}
