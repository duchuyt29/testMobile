import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_involves.dart';
import 'package:ui_api/crm_api/request/activity_checkin_request.dart';
import 'package:ui_api/crm_api/response/activity/activity_detail_response.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_crm_menu_action.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmDetailActivityController extends BaseController {
  Rx<ActivityDetailData> item = Rx(ActivityDetailData());
  bool isUpdate = false;
  RxString address = ''.obs;

  CrmDetailActivityController() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getActivityDetail(Get.arguments ?? 0)
          .then((response) async {
        if (response.success && response.data != null) {
          item.value = response.data ?? ActivityDetailData();
          if (item.value.task?.latitude != null) {
            await getAddress(item.value.task?.latitude ?? 0,
                item.value.task?.longitude ?? 0);
          }

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

  Future<void> activityUpdateState(int id, String state) async {
    try {
      // await EasyLoading.show();
      await crmUIRepository
          .activityUpdateState(id, state)
          .then((response) async {
        if (response.success && response.data != null) {
          isUpdate = true;
          await _loadData();
          // item.value.task = response.data?.task;
          // item.refresh();

          // await EasyLoading.dismiss();
        } else {
          // await EasyLoading.dismiss();
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

  Future<void> checkinActivity(int id, ActivityCheckinRequest request) async {
    try {
      // await EasyLoading.show();
      await crmUIRepository.checkinActivity(id, request).then((response) async {
        if (response.success) {
          isUpdate = true;
          await _loadData();
          // item.value.task = response.data?.task;
          // item.refresh();

          // await EasyLoading.dismiss();
        } else {
          // await EasyLoading.dismiss();
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

  Widget check() {
    if (item.value.task?.activityTypeId == ActivityType.TASK_OBJECT.value) {
      return _buildBodyContentJob();
    }
    if (item.value.task?.activityTypeId ==
        ActivityType.PHONE_CALL_OBJECT.value) {
      return _buildBodyContentCall();
    }
    if (item.value.task?.activityTypeId == ActivityType.EMAIL_OBJECT.value) {
      return _buildBodyContentEmail();
    }
    if (item.value.task?.activityTypeId ==
        ActivityType.APPOINTMENT_OBJECT.value) {
      return _buildBodyContentAppointment();
    }
    return Container();
  }

  String getTitleText() {
    var temp = '';

    if (item.value.task?.activityTypeId == ActivityType.TASK_OBJECT.value) {
      temp = ActivityType.TASK_OBJECT.text;
    } else if (item.value.task?.activityTypeId ==
        ActivityType.PHONE_CALL_OBJECT.value) {
      temp = ActivityType.PHONE_CALL_OBJECT.text;
    } else if (item.value.task?.activityTypeId ==
        ActivityType.EMAIL_OBJECT.value) {
      temp = ActivityType.EMAIL_OBJECT.text;
    } else if (item.value.task?.activityTypeId ==
        ActivityType.APPOINTMENT_OBJECT.value) {
      temp = ActivityType.APPOINTMENT_OBJECT.text;
    }

    return temp;
  }

  String getPriorityText() {
    var temp = '';

    for (var i = 0;
        i < AppDataGlobal.crmMasterData!.listPriority!.length;
        i++) {
      if (AppDataGlobal.crmMasterData!.listPriority![i].id ==
          item.value.task?.priorityId) {
        temp = AppDataGlobal.crmMasterData!.listPriority![i].priorityName ?? '';
        break;
      }
    }

    return temp;
  }

  String getObjectTypeText() {
    var temp = '';

    if (item.value.task?.objectTypeId == TaskObjectType.ACCOUNT_OBJECT.id) {
      temp = TaskObjectType.ACCOUNT_OBJECT.text;
    } else if (item.value.task?.objectTypeId == TaskObjectType.LEAD_OBJECT.id) {
      temp = TaskObjectType.LEAD_OBJECT.text;
    } else if (item.value.task?.objectTypeId == TaskObjectType.OPP_OBJECT.id) {
      temp = TaskObjectType.OPP_OBJECT.text;
    } else if (item.value.task?.objectTypeId ==
        TaskObjectType.QUOTE_OBJECT.id) {
      temp = TaskObjectType.QUOTE_OBJECT.text;
    } else if (item.value.task?.objectTypeId ==
        TaskObjectType.CONTRACT_OBJECT.id) {
      temp = TaskObjectType.CONTRACT_OBJECT.text;
    } else if (item.value.task?.objectTypeId ==
        TaskObjectType.ORDER_OBJECT.id) {
      temp = TaskObjectType.ORDER_OBJECT.text;
    }

    return temp;
  }

  String getObjectNameText() {
    var temp = '';

    if (item.value.task?.objectTypeId == TaskObjectType.ACCOUNT_OBJECT.id) {
      temp = item.value.task?.accountName ?? '';
    } else if (item.value.task?.objectTypeId == TaskObjectType.LEAD_OBJECT.id) {
      temp = item.value.task?.leadName ?? '';
    } else if (item.value.task?.objectTypeId == TaskObjectType.OPP_OBJECT.id) {
      temp = item.value.task?.opportunityName ?? '';
    } else if (item.value.task?.objectTypeId ==
        TaskObjectType.QUOTE_OBJECT.id) {
      temp = item.value.task?.quoteName ?? '';
    } else if (item.value.task?.objectTypeId ==
        TaskObjectType.CONTRACT_OBJECT.id) {
      temp =
          '${item.value.task?.contractNumber ?? ''} - ${item.value.task?.contractNumberInput ?? ''}';
    } else if (item.value.task?.objectTypeId ==
        TaskObjectType.ORDER_OBJECT.id) {
      temp = item.value.task?.orderNumber ?? '';
    }

    return temp;
  }

  String getTaskTypeText() {
    var temp = '';

    for (var i = 0; i < AppDataGlobal.crmMasterData!.taskType!.length; i++) {
      if (AppDataGlobal.crmMasterData!.taskType![i].id ==
          item.value.task?.taskTypeId) {
        temp = AppDataGlobal.crmMasterData!.taskType![i].taskTypeName ?? '';
        break;
      }
    }

    return temp;
  }

  String getDurationTypeText() {
    var temp = '';

    for (var i = 0;
        i < AppDataGlobal.crmMasterData!.listDurationUnit!.length;
        i++) {
      if (AppDataGlobal.crmMasterData!.listDurationUnit![i].id ==
          item.value.task?.durationUnitId) {
        temp = AppDataGlobal
                .crmMasterData!.listDurationUnit![i].durationUnitName ??
            '';
        break;
      }
    }

    return temp;
  }

  String getNameRequesterEmployee() {
    if (item.value.involves?.any((element) => element.role == 'REQUESTER') ??
        false) {
      final temp = item.value.involves?[item.value.involves!
          .indexWhere((element) => element.role == 'REQUESTER')];
      if (temp?.involveIds != null) {
        return temp?.involveIds?[0].fullName ?? '';
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  String getNameReponsiableEmployee() {
    final temp = item.value.involves?.firstWhere(
        (element) => element.role == 'RESPONSIBLE',
        orElse: () => ActivityInvolves());

    var reponsiableEmployeeText = '';
    if (temp?.involveIds != null) {
      for (var i = 0; i < temp!.involveIds!.length; i++) {
        if (i == temp.involveIds!.length - 1) {
          reponsiableEmployeeText += temp.involveIds![i].fullName ?? '';
        } else {
          reponsiableEmployeeText += '${temp.involveIds![i].fullName},\n';
        }
      }
    }

    return reponsiableEmployeeText;
  }

  String getNameParticipanterEmployee() {
    final temp = item.value.involves?.firstWhere(
        (element) => element.role == 'ASSIGNEE',
        orElse: () => ActivityInvolves());

    var participanterText = '';
    if (temp?.involveIds != null) {
      for (var i = 0; i < temp!.involveIds!.length; i++) {
        if (i == temp.involveIds!.length - 1) {
          participanterText += temp.involveIds![i].fullName ?? '';
        } else {
          participanterText += '${temp.involveIds![i].fullName},\n';
        }
      }
    }

    return participanterText;
  }

  Future<void> getAddress(double lat, double long) async {
    await AppUtil()
        .getAddress(lat, long)
        .then((value) => address.value = value);

    // return temp;
  }

  Future<void> onMenuAction() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuAction(
        onChangeStateActivityTap: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleActivity?.changeStateTask !=
                null
            ? showCreateModalBottomSheet
            : null,
        onEditActivityTap: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleActivity?.updateTask !=
                null
            ? () {
                switch (item.value.task?.activityTypeId) {
                  case 1:
                    Get.toNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB,
                        arguments: {
                          'isEdit': true,
                          'dataEdit': item.value,
                        })?.then((value) {
                      if (value != null && value) {
                        isUpdate = value;
                        _loadData();
                      }
                    });
                    break;
                  case 2:
                    Get.toNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_CALL,
                        arguments: {
                          'isEdit': true,
                          'dataEdit': item.value,
                        })?.then((value) {
                      if (value != null && value) {
                        isUpdate = value;
                        _loadData();
                      }
                    });
                    break;
                  case 3:
                    Get.toNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_EMAIL,
                        arguments: {
                          'isEdit': true,
                          'dataEdit': item.value,
                        })?.then((value) {
                      if (value != null && value) {
                        isUpdate = value;
                        _loadData();
                      }
                    });
                    break;
                  case 4:
                    Get.toNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_APPOINTMENT,
                        arguments: {
                          'isEdit': true,
                          'dataEdit': item.value,
                        })?.then((value) {
                      if (value != null && value) {
                        isUpdate = value;
                        _loadData();
                      }
                    });
                    break;
                  default:
                }
              }
            : null,
        onCheckIn: item.value.task?.latitude == null
            ? () async {
                final temp = await AppUtil().getPosition();
                if (temp != null) {
                  await checkinActivity(
                    item.value.task?.id ?? 0,
                    ActivityCheckinRequest(
                        id: item.value.task?.id ?? 0,
                        latitude: temp.latitude,
                        longitude: temp.longitude),
                  );
                }
                print(temp);
              }
            : null,
      ),
    );
  }

  Future<void> showCreateModalBottomSheetnewwwwwww() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuAction(
        onAddActivity: showCreateActivityModalBottomSheet,
        // onDeleteTap: onDeleteAccount,
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
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
              // onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB,
              //     arguments: {
              //       'type': TaskObjectType.ACCOUNT_OBJECT,
              //       'data': account.value
              //     })?.then((value) {
              //   if (value != null && value) {
              //     getActivities(0, request);
              //   }
              // }),
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
              // onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_CALL,
              //     arguments: {
              //       'type': TaskObjectType.ACCOUNT_OBJECT,
              //       'data': account.value
              //     })?.then((value) {
              //   if (value != null && value) {
              //     getActivities(0, request);
              //   }
              // }),
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
              // onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_EMAIL,
              //     arguments: {
              //       'type': TaskObjectType.ACCOUNT_OBJECT,
              //       'data': account.value
              //     })?.then((value) {
              //   if (value != null && value) {
              //     getActivities(0, request);
              //   }
              // }),
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
              // onTap: () => Get.offNamed(
              //     CRMRoutes.CRM_ACTIVITY_ADD_FORM_APPOINTMENT,
              //     arguments: {
              //       'type': TaskObjectType.ACCOUNT_OBJECT,
              //       'data': account.value
              //     })?.then((value) {
              //   if (value != null && value) {
              //     getActivities(0, request);
              //   }
              // }),
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

  Future<void> showCreateModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'Chọn trạng thái',
        option: List.generate(
          item.value.task!.nextStates!.length,
          (index) => MenuOptionModel(
              onAction: () async {
                Get.back();
                await activityUpdateState(item.value.task?.id ?? 0,
                    item.value.task?.nextStates?[index] ?? '');
              },
              title: AppUtil.getStateText(
                  item.value.task?.nextStates?[index] ?? '')),
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

  Widget _buildBodyContentJob() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('crm.activity.status'.tr)),
              Flexible(
                flex: 1,
                child: Visibility(
                  visible: item.value.task?.state != null,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 25,
                    decoration: BoxDecoration(
                        // color: trangThaiBgColor,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Text(
                      AppUtil.getStateText(item.value.task?.state ?? ''),
                      // style: TextStyle(color: trangThaiTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildItemField(
          label: 'crm.activity.topic'.tr,
          value: item.value.task?.name ?? '',
        ),
        _buildItemField(
          label: 'crm.activity.priority.level'.tr,
          value: getPriorityText(),
        ),
        _buildItemField(
          label: 'crm.activity.belonged'.tr,
          value: getObjectTypeText(),
        ),
        _buildItemField(
            label: 'crm.activity.name'.tr, value: getObjectNameText()),
        _buildItemField(
          label: 'crm.activity.begin.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.startDate,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.completion'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.deadline,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.success.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.closedOn,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
            label: 'crm.activity.type.of.work'.tr, value: getTaskTypeText()),
        _buildItemAvata(
            image: ImageConstants.avatar, name: getNameRequesterEmployee()),
        _buildItemField(
            label: 'crm.activity.contact'.tr,
            value: item.value.task?.contactName ?? ''),
        _buildItemField(
            label: 'crm.activity.responsible'.tr,
            value: getNameReponsiableEmployee()),
        _buildItemField(
          label: 'crm.desc'.tr,
          value: item.value.task?.description ?? '',
        ),
        _buildFooter(
          nameCreate: item.value.task?.createByUser?.fullName ?? '',
          timeCreate: DateUtil.formatDatetimeToString(
              item.value.task?.createDate,
              type: DateUtil.DATETIME_TYPE),
          nameUpdate: item.value.task?.updateByUser?.fullName ?? '',
          timeUpdate: DateUtil.formatDatetimeToString(
              item.value.task?.modifiedDate,
              type: DateUtil.DATETIME_TYPE),
          nameCheckin: item.value.task?.checkInByUser?.fullName ?? '',
          timeCheckin: DateUtil.formatDatetimeToString(
              item.value.task?.checkInDate,
              type: DateUtil.DATETIME_TYPE),
          address: address.value,
        )
      ],
    );
  }

  Widget _buildBodyContentCall() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('crm.activity.status'.tr)),
              Flexible(
                flex: 1,
                child: Visibility(
                  visible: item.value.task?.state != null,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 25,
                    decoration: BoxDecoration(
                        // color: trangThaiBgColor,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Text(
                      AppUtil.getStateText(item.value.task?.state ?? ''),
                      // style: TextStyle(color: trangThaiTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildItemField(
          label: 'crm.activity.topic'.tr,
          value: item.value.task?.name ?? '',
        ),
        _buildItemField(
          label: 'crm.activity.priority.level'.tr,
          value: getPriorityText(),
        ),
        _buildItemField(
          label: 'crm.activity.belonged'.tr,
          value: getObjectTypeText(),
        ),
        _buildItemField(
            label: 'crm.activity.name'.tr, value: getObjectNameText()),
        _buildItemField(
          label: 'crm.activity.begin.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.startDate,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.completion'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.deadline,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.success.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.closedOn,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
            label: 'phone.number'.tr,
            value: item.value.task?.phoneNumber ?? ''),
        _buildItemField(
            label: 'crm.activity.receiver1'.tr,
            value: item.value.task?.involvedPeople ?? ''),
        _buildItemAvata(
            image: ImageConstants.avatar, name: getNameRequesterEmployee()),
        _buildItemField(
            label: 'crm.activity.duration'.tr,
            value: item.value.task?.duration.toString() ?? ''),
        _buildItemField(
            label: 'crm.activity.unit'.tr, value: getDurationTypeText()),
        _buildItemField(
            label: 'crm.activity.responsible'.tr,
            value: getNameReponsiableEmployee()),
        _buildItemField(
          label: 'crm.desc'.tr,
          value: item.value.task?.description ?? '',
        ),
        _buildFooter(
          nameCreate: item.value.task?.createByUser?.fullName ?? '',
          timeCreate: DateUtil.formatDatetimeToString(
              item.value.task?.createDate,
              type: DateUtil.DATETIME_TYPE),
          nameUpdate: item.value.task?.updateByUser?.fullName ?? '',
          timeUpdate: DateUtil.formatDatetimeToString(
              item.value.task?.modifiedDate,
              type: DateUtil.DATETIME_TYPE),
          nameCheckin: item.value.task?.checkInByUser?.fullName ?? '',
          timeCheckin: DateUtil.formatDatetimeToString(
              item.value.task?.checkInDate,
              type: DateUtil.DATETIME_TYPE),
          address: address.value,
        )
      ],
    );
  }

  Widget _buildBodyContentEmail() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('crm.activity.status'.tr)),
              Flexible(
                flex: 1,
                child: Visibility(
                  visible: item.value.task?.state != null,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 25,
                    decoration: BoxDecoration(
                        // color: trangThaiBgColor,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Text(
                      AppUtil.getStateText(item.value.task?.state ?? ''),
                      // style: TextStyle(color: trangThaiTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildItemField(
          label: 'crm.activity.topic'.tr,
          value: item.value.task?.name ?? '',
        ),
        _buildItemField(
          label: 'crm.activity.priority.level'.tr,
          value: getPriorityText(),
        ),
        _buildItemField(
          label: 'crm.activity.belonged'.tr,
          value: getObjectTypeText(),
        ),
        _buildItemField(
            label: 'crm.activity.name'.tr, value: getObjectNameText()),
        _buildItemField(
          label: 'crm.activity.begin.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.startDate,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.completion'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.deadline,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.success.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.closedOn,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
            label: 'crm.activity.receiver1'.tr,
            value: item.value.task?.involvedPeople ?? ''),
        _buildItemAvata(
            image: ImageConstants.avatar, name: getNameRequesterEmployee()),
        _buildItemField(
            label: 'crm.activity.responsible'.tr,
            value: getNameReponsiableEmployee()),
        _buildItemField(
          label: 'crm.desc'.tr,
          value: item.value.task?.description ?? '',
        ),
        _buildFooter(
          nameCreate: item.value.task?.createByUser?.fullName ?? '',
          timeCreate: DateUtil.formatDatetimeToString(
              item.value.task?.createDate,
              type: DateUtil.DATETIME_TYPE),
          nameUpdate: item.value.task?.updateByUser?.fullName ?? '',
          timeUpdate: DateUtil.formatDatetimeToString(
              item.value.task?.modifiedDate,
              type: DateUtil.DATETIME_TYPE),
          nameCheckin: item.value.task?.checkInByUser?.fullName ?? '',
          timeCheckin: DateUtil.formatDatetimeToString(
              item.value.task?.checkInDate,
              type: DateUtil.DATETIME_TYPE),
          address: address.value,
        )
      ],
    );
  }

  Widget _buildBodyContentAppointment() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('crm.activity.status'.tr)),
              Flexible(
                flex: 1,
                child: Visibility(
                  visible: item.value.task?.state != null,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 25,
                    decoration: BoxDecoration(
                        // color: trangThaiBgColor,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Text(
                      AppUtil.getStateText(item.value.task?.state ?? ''),
                      // style: TextStyle(color: trangThaiTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildItemField(
          label: 'crm.activity.topic'.tr,
          value: item.value.task?.name ?? '',
        ),
        _buildItemField(
          label: 'crm.activity.priority.level'.tr,
          value: getPriorityText(),
        ),
        _buildItemField(
          label: 'crm.activity.belonged'.tr,
          value: getObjectTypeText(),
        ),
        _buildItemField(
            label: 'crm.activity.name'.tr, value: getObjectNameText()),
        _buildItemField(
          label: 'crm.activity.begin.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.startDate,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.completion'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.deadline,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
          label: 'crm.activity.success.day'.tr,
          value: DateUtil.formatDatetimeToString(item.value.task?.closedOn,
              type: DateUtil.DATETIME_TYPE),
        ),
        _buildItemField(
            label: 'crm.activity.duration'.tr,
            value: item.value.task?.duration.toString() ?? ''),
        _buildItemField(
            label: 'crm.activity.unit'.tr, value: getDurationTypeText()),
        _buildItemField(
            label: 'crm.activity.contact'.tr,
            value: item.value.task?.contactName ?? ''),
        _buildItemAvata(
            image: ImageConstants.avatar, name: getNameRequesterEmployee()),
        _buildItemField(
            label: 'crm.activity.participant'.tr,
            value: getNameParticipanterEmployee()),
        _buildItemField(
            label: 'crm.activity.responsible'.tr,
            value: getNameReponsiableEmployee()),
        _buildItemField(
          label: 'crm.desc'.tr,
          value: item.value.task?.description ?? '',
        ),
        _buildFooter(
          nameCreate: item.value.task?.createByUser?.fullName ?? '',
          timeCreate: DateUtil.formatDatetimeToString(
              item.value.task?.createDate,
              type: DateUtil.DATETIME_TYPE),
          nameUpdate: item.value.task?.updateByUser?.fullName ?? '',
          timeUpdate: DateUtil.formatDatetimeToString(
              item.value.task?.modifiedDate,
              type: DateUtil.DATETIME_TYPE),
          nameCheckin: item.value.task?.checkInByUser?.fullName ?? '',
          timeCheckin: DateUtil.formatDatetimeToString(
              item.value.task?.checkInDate,
              type: DateUtil.DATETIME_TYPE),
          address: address.value,
        )
      ],
    );
  }

  Container _buildItemField({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: Text(label)), Expanded(child: Text(value))],
      ),
    );
  }

  Column _buildFooter({
    required String nameCreate,
    required String timeCreate,
    required String nameUpdate,
    required String timeUpdate,
    required String nameCheckin,
    required String timeCheckin,
    required String address,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'crm.infor.system'.tr,
            style: AppTextStyle.bold(fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'crm.create.by'.tr}: '),
              Row(
                children: [
                  Text(
                    nameCreate,
                    style: AppTextStyle.regular(color: Colors.blue),
                  ),
                  const SizedBox(width: 10),
                  Text(timeCreate),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'crm.update.by'.tr}: '),
              Row(
                children: [
                  Text(
                    nameUpdate,
                    style: AppTextStyle.regular(color: Colors.blue),
                  ),
                  const SizedBox(width: 10),
                  Text(timeUpdate),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        address.isNotEmpty
            ? Container(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${'crm.checkin.by'.tr}: '),
                    Row(
                      children: [
                        Text(
                          nameCheckin,
                          style: AppTextStyle.regular(color: Colors.blue),
                        ),
                        const SizedBox(width: 10),
                        Text('$timeCheckin tại '),
                      ],
                    ),
                    Container(
                      child: Text(address),
                    ),
                  ],
                ),
              )
            : Container(),
        address.isNotEmpty
            ? const Divider(
                thickness: 1,
              )
            : Container(),
      ],
    );
  }

  Container _buildItemAvata({
    required String image,
    required String name,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text('crm.activity.requester'.tr)),
          Expanded(child: Text(name))
        ],
      ),
    );
  }
}
