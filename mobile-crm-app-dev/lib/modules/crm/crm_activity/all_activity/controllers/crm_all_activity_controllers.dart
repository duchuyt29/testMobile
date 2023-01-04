import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/crm_api/models/activity/activity_condition.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/models/activity/activity_involves.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/request/activity_request.dart';
import 'package:ui_api/crm_api/response/activity/activity_detail_response.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmAllActivityController extends BaseController {
  final listActivity = RxList<ActivityContent>([]);
  List<ActivityCondition> list = [AppDataGlobal.activityCondition];
  Rx<ActivityDetailData> item = Rx(ActivityDetailData());
  List<EmployeeModel> requester = List.empty(growable: true);
  List<EmployeeModel> responsiable = List.empty(growable: true);

  TextEditingController name = TextEditingController();

  final allRefreshController = RefreshController();
  final isMore = RxBool(true);

  int page = 0;

  ActivityRequest request = ActivityRequest();

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  CrmAllActivityController() {
    try {
      requester.add(AppDataGlobal.employees[AppDataGlobal.employees.indexWhere(
          (element) => element.userId == AppDataGlobal.userInfo?.id)]);
    } catch (e) {}

    request = ActivityRequest(
        checkActivityTask: false,
        checkPermission: false,
        conditions: [
          ActivityCondition(
            logicOperator: '',
            conditionType: 'GROUP',
            filterType: 'ROLE',
            children: list,
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
      onRefresh();
    }
  }

  void onRefresh() => getActivities(0, request);
  void onLoading() => getActivities(page + 1, request);

  void _updateRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? allRefreshController.refreshFailed()
          : allRefreshController.refreshCompleted();
    } else {
      isError
          ? allRefreshController.loadFailed()
          : allRefreshController.loadComplete();
    }
  }

  Future<void> getActivities(int page, ActivityRequest request) async {
    await EasyLoading.show();
    await crmUIRepository
        .getActivities(page, CommonConstants.defaultSize,
            CommonConstants.sortCreateDateDesc, request)
        .then((response) async {
      if (response.success) {
        _updateRefreshController(page);
        if (page == 0) {
          listActivity.clear();
        }

        final activityContents = response.data?.content ?? [];
        await Future.forEach(activityContents,
            (ActivityContent activity) async {
          listActivity.add(activity);
        });
        this.page = page;
        isMore.value = response.data?.isMore() ?? false;
        await EasyLoading.dismiss();
      } else {
        _updateRefreshController(page, isError: true);
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      _updateRefreshController(page, isError: true);
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> updateActivity(
      int page, ActivityRequest request, int index) async {
    await EasyLoading.show();
    await crmUIRepository
        .getActivities(page, CommonConstants.defaultSize,
            CommonConstants.sortCreateDateDesc, request)
        .then((response) async {
      if (response.success) {
        for (var i = 0; i < response.data!.content!.length; i++) {
          if (listActivity[index].task?.id ==
              response.data!.content![i].task?.id) {
            listActivity[index] = response.data!.content![i];
            listActivity.refresh();
            break;
          }
        }
        await EasyLoading.dismiss();
      } else {
        _updateRefreshController(page, isError: true);
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      _updateRefreshController(page, isError: true);
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  String getNameReponsiableEmployee(List<ActivityInvolves> involves) {
    final temp = involves.firstWhere((element) => element.role == 'RESPONSIBLE',
        orElse: () => ActivityInvolves());

    var reponsiableEmployeeText = '';
    if (temp.involveIds != null) {
      for (var i = 0; i < temp.involveIds!.length; i++) {
        if (i == temp.involveIds!.length - 1) {
          reponsiableEmployeeText += temp.involveIds![i].fullName ?? '';
        } else {
          reponsiableEmployeeText += '${temp.involveIds![i].fullName},\n';
        }
      }
    }

    return reponsiableEmployeeText;
  }

  String getPriorityText(int id) {
    var temp = '';
    for (var i = 0;
        i < AppDataGlobal.crmMasterData!.listPriority!.length;
        i++) {
      if (AppDataGlobal.crmMasterData!.listPriority![i].id == id) {
        temp = AppDataGlobal.crmMasterData!.listPriority![i].priorityName ?? '';
        break;
      }
    }

    return temp;
  }

  Future<void> activityUpdateState(int id, String state, int index) async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .activityUpdateState(id, state)
          .then((response) async {
        if (response.success && response.data != null) {
          await updateActivity(page, request, index);

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

  final language = RxString('language'.tr);

  Future<void> onViewFilterActivity() async {
    await Get.toNamed(
      CRMRoutes.CRM_ACTIVITY_FILTER,
      arguments: {
        'activityType':
            list.any((element) => element.fieldName == 'activity_type_id')
                ? list[list.indexWhere(
                        (element) => element.fieldName == 'activity_type_id')]
                    .values
                : [],
        'tasksObject':
            list.any((element) => element.fieldName == 'object_type_id')
                ? list[list.indexWhere(
                        (element) => element.fieldName == 'object_type_id')]
                    .values
                : [],
        'state': list.any((element) => element.fieldName == 'state')
            ? list[list.indexWhere((element) => element.fieldName == 'state')]
                .values
            : [],
        'priority': list.any((element) => element.fieldName == 'priority_id')
            ? list[list.indexWhere(
                    (element) => element.fieldName == 'priority_id')]
                .values
            : [],
        'responsiable': responsiable,
        'requester': requester,
      },
    )?.then((value) {
      if (value != null) {
        list = [];

        if (name.text.isNotEmpty) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'name',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'LIKE',
              values: [name],
            ),
          );
        }

        if (value['activityType'] != null &&
            value['activityType'] is List<int> &&
            value['activityType'].length > 0) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'activity_type_id',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'IN',
              values: value['activityType'],
            ),
          );
        }

        if (value['tasksObject'] != null &&
            value['tasksObject'] is List<int> &&
            value['tasksObject'].length > 0) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'object_type_id',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'IN',
              values: value['tasksObject'],
            ),
          );
        }

        if (value['state'] != null &&
            value['state'] is List<String> &&
            value['state'].length > 0) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'state',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'IN',
              values: value['state'],
            ),
          );
        }

        if (value['priority'] != null &&
            value['priority'] is List<int> &&
            value['priority'].length > 0) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'priority_id',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'IN',
              values: value['priority'],
            ),
          );
        }

        if (value['responsiable'] != null &&
            value['responsiable'] is List<EmployeeModel>) {
          responsiable = value['responsiable'];
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'responsible_id',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'IN',
              values:
                  value['responsiable']?.map((e) => e.userId ?? '').toList() ??
                      [],
            ),
          );
        } else {
          responsiable = [];
        }

        if (value['requester'] != null &&
            value['requester'] is List<EmployeeModel>) {
          requester = value['requester'];
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'responsible_id',
              fieldType: 'STRING',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: 'IN',
              values:
                  value['requester']?.map((e) => e.userId ?? '').toList() ?? [],
            ),
          );
        } else {
          requester = [];
        }

        if (value['dateStartFrom'] != null) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'start_date',
              fieldType: 'DATE',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: '>=',
              values: [
                DateUtil.formatDatetimeToString(value['dateStartFrom']?.toUtc(),
                    type: DateUtil.API_TYPE)
              ],
            ),
          );
        }

        if (value['dateStartTo'] != null) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'start_date',
              fieldType: 'DATE',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: '<=',
              values: [
                DateUtil.formatDatetimeToString(value['dateStartTo']?.toUtc(),
                    type: DateUtil.API_TYPE)
              ],
            ),
          );
        }

        if (value['dateDoneFrom'] != null) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'closed_on',
              fieldType: 'DATE',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: '>=',
              values: [
                DateUtil.formatDatetimeToString(value['dateDoneFrom']?.toUtc(),
                    type: DateUtil.API_TYPE)
              ],
            ),
          );
        }

        if (value['dateDoneTo'] != null) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'closed_on',
              fieldType: 'DATE',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: '<=',
              values: [
                DateUtil.formatDatetimeToString(value['dateDoneTo']?.toUtc(),
                    type: DateUtil.API_TYPE)
              ],
            ),
          );
        }

        if (value['deadlineFrom'] != null) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'deadline',
              fieldType: 'DATE',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: '>=',
              values: [
                DateUtil.formatDatetimeToString(value['deadlineFrom']?.toUtc(),
                    type: DateUtil.API_TYPE)
              ],
            ),
          );
        }

        if (value['deadlineTo'] != null) {
          list.add(
            ActivityCondition(
              conditionType: 'RULE',
              fieldName: 'deadline',
              fieldType: 'DATE',
              filterType: 'FIELD',
              logicOperator: 'AND',
              operator: '<=',
              values: [
                DateUtil.formatDatetimeToString(value['deadlineTo']?.toUtc(),
                    type: DateUtil.API_TYPE)
              ],
            ),
          );
        }

        request = ActivityRequest(
            checkActivityTask: false,
            checkPermission: false,
            conditions: [
              ActivityCondition(
                logicOperator: '',
                conditionType: 'GROUP',
                filterType: 'ROLE',
                children: list,
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
        onRefresh();
      }
    });
  }

  Future<void> onSearchName(String name) async {
    if (name.isEmpty) {
      if (list.any((element) => element.fieldName == 'name')) {
        list.removeAt(
            list.indexWhere((element) => element.fieldName == 'name'));
      }
    } else {
      if (list.any((element) => element.fieldName == 'name')) {
        list[list.indexWhere((element) => element.fieldName == 'name')]
            .values
            ?.clear();
        list[list.indexWhere((element) => element.fieldName == 'name')]
            .values
            ?.add(name);
      } else {
        list.add(
          ActivityCondition(
            conditionType: 'RULE',
            fieldName: 'name',
            fieldType: 'STRING',
            filterType: 'FIELD',
            logicOperator: 'AND',
            operator: 'LIKE',
            values: [name],
          ),
        );
      }
    }

    request = ActivityRequest(
        checkActivityTask: false,
        checkPermission: false,
        conditions: [
          ActivityCondition(
            logicOperator: '',
            conditionType: 'GROUP',
            filterType: 'ROLE',
            children: list,
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

    onRefresh();
  }

  Future<void> showChangeStateModalBottomSheet(
      int id, List<String> item, int index) async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'Chọn trạng thái',
        option: List.generate(
          item.length,
          (i) => MenuOptionModel(
              onAction: () async {
                Get.back();
                await activityUpdateState(id, item[i], index);
              },
              title: AppUtil.getStateText(item[i])),
        ),
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  Future<void> showCreateModalBottomSheet() async {
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
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_job'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB)
                  ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_call'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_CALL)
                  ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_email'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_EMAIL)
                  ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_meeting'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () =>
                  Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_APPOINTMENT)
                      ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
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
