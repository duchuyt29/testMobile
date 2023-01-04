import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_condition.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/date_util.dart';

class CrmFilterActivityController extends BaseController {
  final List<ActivityCondition> filter =
      List<ActivityCondition>.empty(growable: true);

  RxString responsiableText = ''.obs;
  RxString requesterText = ''.obs;
  RxList<EmployeeModel> responsiable = RxList.empty();
  RxList<EmployeeModel> requester = RxList.empty();

  DateTime? dateStartFrom;
  DateTime? dateStartTo;
  DateTime? dateDoneFrom;
  DateTime? dateDoneTo;
  DateTime? deadlineFrom;
  DateTime? deadlineTo;
  TextEditingController dateStartFromtText = TextEditingController();
  TextEditingController dateStartToText = TextEditingController();
  TextEditingController dateFinishFromtText = TextEditingController();
  TextEditingController dateFinishToText = TextEditingController();
  TextEditingController deadlineFromtText = TextEditingController();
  TextEditingController deadlineToText = TextEditingController();

  RxString activityType = ''.obs;
  RxString tasksObject = ''.obs;
  RxString state = ''.obs;
  RxString priority = ''.obs;

  List<int> activityTypeSelected = [];
  List<int> tasksObjectSelected = [];
  List<int> prioritySelected = [];
  List<int> stateSelected = [];
  List<String> stateSelectValue = [];

  CrmFilterActivityController() {
    final agrument = Get.arguments;
    if (agrument['activityType'].isNotEmpty) {
      activityTypeSelected = agrument['activityType'];
      getTextFromList(activityType, activityTypeSelected, 1, false);
    }

    if (agrument['tasksObject'].isNotEmpty) {
      tasksObjectSelected = agrument['tasksObject'];
      getTextFromList(tasksObject, tasksObjectSelected, 2, false);
    }

    if (agrument['state'].isNotEmpty) {
      final temp = agrument['state'];
      for (final element in temp) {
        if (element == FilterActivitySTATEType.PENDING.value) {
          stateSelected.add(FilterActivitySTATEType.PENDING.index + 1);
        } else if (element == FilterActivitySTATEType.IN_PROGRESS.value) {
          stateSelected.add(FilterActivitySTATEType.IN_PROGRESS.index + 1);
        } else if (element == FilterActivitySTATEType.COMPLETED.value) {
          stateSelected.add(FilterActivitySTATEType.COMPLETED.index + 1);
        } else if (element == FilterActivitySTATEType.DEFERRED.value) {
          stateSelected.add(FilterActivitySTATEType.DEFERRED.index + 1);
        } else if (element == FilterActivitySTATEType.CANCELED.value) {
          stateSelected.add(FilterActivitySTATEType.CANCELED.index + 1);
        } else if (element == FilterActivitySTATEType.REVIEWING.value) {
          stateSelected.add(FilterActivitySTATEType.REVIEWING.index + 1);
        } else if (element == FilterActivitySTATEType.REPROCESS.value) {
          stateSelected.add(FilterActivitySTATEType.REPROCESS.index + 1);
        }
      }
      getTextFromList(state, stateSelected, 3, true);
    }

    if (agrument['priority'].isNotEmpty) {
      prioritySelected = agrument['priority'];
      getTextFromList(priority, prioritySelected, 4, false);
    }

    if (agrument['responsiable'].isNotEmpty) {
      // ignore: prefer_foreach
      for (final element in agrument['responsiable'] as List<EmployeeModel>) {
        responsiable.add(element);
      }
      responsiableText.value = '';
      for (var i = 0; i < responsiable.length; i++) {
        if (i == responsiable.length - 1) {
          responsiableText.value += responsiable[i].getFullname();
        } else {
          responsiableText.value += '${responsiable[i].getFullname()},\n';
        }
      }
      // getTextFromList(priority, prioritySelected, 4, false);
    }

    if (agrument['requester'].isNotEmpty) {
      // ignore: prefer_foreach
      for (final element in agrument['requester'] as List<EmployeeModel>) {
        requester.add(element);
      }
      requesterText.value = '';
      for (var i = 0; i < requester.length; i++) {
        if (i == requester.length - 1) {
          requesterText.value += requester[i].getFullname();
        } else {
          requesterText.value += '${requester[i].getFullname()},\n';
        }
      }
      // getTextFromList(priority, prioritySelected, 4, false);
    }

    print(agrument.toString());
  }

  Future<void> loadResponsibleEmployee() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
        IS_MULTI_SELECT: true,
        LIST_SELECTED: responsiable,
      })?.then((value) {
        if (value != null && value is List<EmployeeModel>) {
          responsiable.clear();
          responsiable.value = value;
          responsiableText.value = '';
          for (var i = 0; i < responsiable.length; i++) {
            if (i == responsiable.length - 1) {
              responsiableText.value += responsiable[i].getFullname();
            } else {
              responsiableText.value += '${responsiable[i].getFullname()},\n';
            }
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadRequesterEmployee() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
        IS_MULTI_SELECT: true,
        LIST_SELECTED: requester,
      })?.then((value) {
        if (value != null && value is List<EmployeeModel>) {
          requester.clear();
          requester.value = value;
          requesterText.value = '';
          for (var i = 0; i < requester.length; i++) {
            if (i == requester.length - 1) {
              requesterText.value += requester[i].getFullname();
            } else {
              requesterText.value += '${requester[i].getFullname()},\n';
            }
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectDate(
      TextEditingController field, FilterActivityDateTimeType type) async {
    await showDatePicker(
      context: Get.context!,
      initialDate: type == FilterActivityDateTimeType.START_DATE_FROM
          ? dateStartFrom ?? DateTime.now()
          : type == FilterActivityDateTimeType.START_DATE_TO
              ? dateStartTo ?? dateStartFrom ?? DateTime.now()
              : type == FilterActivityDateTimeType.DONE_DATE_FROM
                  ? dateDoneFrom ?? DateTime.now()
                  : type == FilterActivityDateTimeType.DONE_DATE_TO
                      ? dateDoneTo ?? dateDoneFrom ?? DateTime.now()
                      : type == FilterActivityDateTimeType.DEADLINE_FROM
                          ? deadlineFrom ?? DateTime.now()
                          : type == FilterActivityDateTimeType.DEADLINE_TO
                              ? deadlineTo ?? deadlineFrom ?? DateTime.now()
                              : DateTime.now(),
      firstDate: type == FilterActivityDateTimeType.START_DATE_TO
          ? dateStartFrom ?? DateTime(2000)
          : type == FilterActivityDateTimeType.DONE_DATE_TO
              ? dateDoneFrom ?? DateTime(2000)
              : type == FilterActivityDateTimeType.DEADLINE_TO
                  ? deadlineFrom ?? DateTime(2000)
                  : DateTime(2000),
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
      if (date != null) {
        switch (type) {
          case FilterActivityDateTimeType.START_DATE_FROM:
            dateStartFrom = DateTime(date.year, date.month, date.day);
            if (dateStartTo != null) {
              if (dateStartFrom?.isAfter(dateStartTo ?? DateTime.now()) ??
                  false) {
                dateStartFrom = dateStartTo;
              }
            }

            field.text = DateUtil.formatDatetimeToString(dateStartFrom?.toUtc(),
                type: DateUtil.DATE_TYPE);
            break;
          case FilterActivityDateTimeType.START_DATE_TO:
            dateStartTo = DateTime(date.year, date.month, date.day);
            field.text = DateUtil.formatDatetimeToString(dateStartTo?.toUtc(),
                type: DateUtil.DATE_TYPE);
            break;
          case FilterActivityDateTimeType.DONE_DATE_FROM:
            dateDoneFrom = DateTime(date.year, date.month, date.day);

            if (dateDoneTo != null) {
              if (dateDoneFrom?.isAfter(dateDoneTo ?? DateTime.now()) ??
                  false) {
                dateDoneFrom = dateDoneTo;
              }
            }
            field.text = DateUtil.formatDatetimeToString(dateDoneFrom?.toUtc(),
                type: DateUtil.DATE_TYPE);
            break;
          case FilterActivityDateTimeType.DONE_DATE_TO:
            dateDoneTo = DateTime(date.year, date.month, date.day);
            field.text = DateUtil.formatDatetimeToString(dateDoneTo?.toUtc(),
                type: DateUtil.DATE_TYPE);
            break;
          case FilterActivityDateTimeType.DEADLINE_FROM:
            deadlineFrom = DateTime(date.year, date.month, date.day);

            if (deadlineTo != null) {
              if (deadlineTo?.isAfter(deadlineTo ?? DateTime.now()) ?? false) {
                deadlineTo = deadlineTo;
              }
            }
            field.text = DateUtil.formatDatetimeToString(deadlineFrom?.toUtc(),
                type: DateUtil.DATE_TYPE);
            break;
          case FilterActivityDateTimeType.DEADLINE_TO:
            dateStartTo = DateTime(date.year, date.month, date.day);
            field.text = DateUtil.formatDatetimeToString(dateStartTo?.toUtc(),
                type: DateUtil.DATE_TYPE);
            break;
          default:
        }
      }
    });
  }

  List<String> getStateSelectedValue(List<int> listSelect) {
    final stateSelectedValue = <String>[];

    for (var i = 0; i < listSelect.length; i++) {
      if (listSelect[i] - 1 == FilterActivitySTATEType.PENDING.index) {
        stateSelectedValue.add(FilterActivitySTATEType.PENDING.value);
      } else if (listSelect[i] - 1 ==
          FilterActivitySTATEType.IN_PROGRESS.index) {
        stateSelectedValue.add(FilterActivitySTATEType.IN_PROGRESS.value);
      } else if (listSelect[i] - 1 == FilterActivitySTATEType.COMPLETED.index) {
        stateSelectedValue.add(FilterActivitySTATEType.COMPLETED.value);
      } else if (listSelect[i] - 1 == FilterActivitySTATEType.DEFERRED.index) {
        stateSelectedValue.add(FilterActivitySTATEType.DEFERRED.value);
      } else if (listSelect[i] - 1 == FilterActivitySTATEType.CANCELED.index) {
        stateSelectedValue.add(FilterActivitySTATEType.CANCELED.value);
      } else if (listSelect[i] - 1 == FilterActivitySTATEType.REVIEWING.index) {
        stateSelectedValue.add(FilterActivitySTATEType.REVIEWING.value);
      } else if (listSelect[i] - 1 == FilterActivitySTATEType.REPROCESS.index) {
        stateSelectedValue.add(FilterActivitySTATEType.REPROCESS.value);
      }
    }

    return stateSelectedValue;
  }

  void getTextFromList(RxString text, List<int> list, int type, bool isStatus) {
    text.value = '';
    print(list);
    list.sort();
    if (isStatus) {
      getStateSelectedValue(list);
    }

    // 1. ActivityType  --  2. TaskObject  --  3. State --  4. Priority
    switch (type) {
      case 1:
        for (var i = 0; i < list.length; i++) {
          if (i == list.length - 1) {
            text.value += CommonConstants.activityType[list[i] - 1];
          } else {
            text.value += '${CommonConstants.activityType[list[i] - 1]},\n';
          }
        }
        break;
      case 2:
        for (var i = 0; i < list.length; i++) {
          if (i == list.length - 1) {
            text.value += CommonConstants.tasksObject[list[i] - 1];
          } else {
            text.value += '${CommonConstants.tasksObject[list[i] - 1]},\n';
          }
        }
        break;
      case 3:
        for (var i = 0; i < list.length; i++) {
          if (i == list.length - 1) {
            text.value += CommonConstants.filterActivityState[list[i] - 1];
          } else {
            text.value +=
                '${CommonConstants.filterActivityState[list[i] - 1]},\n';
          }
        }
        break;
      case 4:
        final listPriority = AppDataGlobal.crmMasterData?.listPriority
                ?.map((e) => e.priorityName ?? '')
                .toList() ??
            [];

        for (var i = 0; i < list.length; i++) {
          if (i == list.length - 1) {
            text.value += listPriority[list[i] - 1];
          } else {
            text.value += '${listPriority[list[i] - 1]},\n';
          }
        }
        break;
      default:
    }
  }
}
