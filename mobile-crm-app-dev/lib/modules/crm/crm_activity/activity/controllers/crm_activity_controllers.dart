import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_condition.dart';
import 'package:ui_api/crm_api/request/activity_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../views/widgets/create_acitivity_modal_sheet.dart';

class CrmActivityController extends BaseController {
  List<ActivityCondition> list = [AppDataGlobal.activityCondition];

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  CrmActivityController() {
    final request = ActivityRequest(
      checkActivityTask: false,
      checkPermission: false,
      include: ['next-states', 'involves'],
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
      ],
      conditions: [
        ActivityCondition(
          logicOperator: '',
          conditionType: 'GROUP',
          filterType: 'ROLE',
          children: list,
        ),
      ],
    );
    getActivities(0, request);
  }

  Future<void> getActivities(int page, ActivityRequest request) async {
    await crmUIRepository
        .getActivities(page, CommonConstants.defaultSize,
            CommonConstants.sortCreateDateDesc, request)
        .then((response) async {
      if (response.success) {
      } else {}
    }).catchError((onError) {
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> onViewAllActi() async {
    await Get.toNamed(CRMRoutes.CRM_ALL_ACTIVITY);
  }

  Future<void> showCreateModalBottomSheet() async {
    await Get.bottomSheet(const CreateActivityModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }
}
