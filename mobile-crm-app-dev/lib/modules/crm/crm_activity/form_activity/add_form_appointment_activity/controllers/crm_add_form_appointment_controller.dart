import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/activity/activity_contact.dart';
import 'package:ui_api/crm_api/models/activity/activity_contract.dart';
import 'package:ui_api/crm_api/models/activity/activity_create_involve.dart';
import 'package:ui_api/crm_api/models/activity/activity_create_task.dart';
import 'package:ui_api/crm_api/models/activity/activity_involves.dart';
import 'package:ui_api/crm_api/models/activity/activity_lead.dart';
import 'package:ui_api/crm_api/models/activity/activity_opp.dart';
import 'package:ui_api/crm_api/models/activity/activity_order.dart';
import 'package:ui_api/crm_api/models/activity/activity_qoute.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';
import 'package:ui_api/crm_api/request/activity_create_request.dart';
import 'package:ui_api/crm_api/request/activity_edit_request.dart';
import 'package:ui_api/crm_api/response/activity/activity_detail_response.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class CrmAddFormAppointmentController extends BaseController {
  RxBool isEdit = false.obs;
  RxBool isHaveData = false.obs;
  ActivityDetailData item = ActivityDetailData();

  List<ActivityCreateInvolve> involves = List.empty(growable: true);

  RxString responsiableText = ''.obs;
  RxString participanterText = ''.obs;
  Rx<EmployeeModel> requester = Rx(EmployeeModel());
  RxList<EmployeeModel> responsiable = RxList.empty();
  RxList<EmployeeModel> participantes = RxList.empty();
  Rx<ActivityContact> activityContact = Rx(ActivityContact());

  int objectTypeId = 0;
  int priorityId = 0;
  int takeTypeId = 0;
  int contactId = 0;

  int accountId = 0;
  int leadId = 0;
  int opportunityId = 0;
  int quoteId = 0;
  int contractId = 0;
  int orderId = 0;

  int durationUnitId = 0;
  RxString name = ''.obs;
  RxString participantEmployee = ''.obs;
  DateTime dateStart = DateTime.now();
  DateTime deadline = DateTime.now();

  TextEditingController topic = TextEditingController();
  TextEditingController dateStartText = TextEditingController();
  TextEditingController deadlineText = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController involvedPeople = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController note = TextEditingController();

  final fbKey = GlobalKey<FormBuilderState>();

  CrmAddFormAppointmentController() {
    dateStartText.text = DateUtil.formatDatetimeToString(dateStart.toUtc(),
        type: DateUtil.DATETIME_TYPE);
    requester.value = EmployeeModel(
      id: AppDataGlobal.userInfo?.employeeInfo?.id,
      employeeCode: AppDataGlobal.userInfo?.employeeInfo?.employeeCode,
      employeeLastName: AppDataGlobal.userInfo?.employeeInfo?.employeeLastName,
      employeeMiddleName:
          AppDataGlobal.userInfo?.employeeInfo?.employeeMiddleName,
      employeeFirstName:
          AppDataGlobal.userInfo?.employeeInfo?.employeeFirstName,
      userId: AppDataGlobal.userInfo?.employeeInfo?.userId,
      isAdmin: AppDataGlobal.userInfo?.employeeInfo?.isAdmin,
      employeeTitleId: AppDataGlobal.userInfo?.employeeInfo?.employeeTitleId,
      isActive: AppDataGlobal.userInfo?.employeeInfo?.isActive,
    );

    if (Get.arguments != null) {
      final arguments = Get.arguments as Map;

      isEdit.value = arguments['isEdit'] ?? false;
      if (arguments['data'] != null) {
        isHaveData.value = true;
      } else {
        isHaveData.value = false;
      }

      if (isEdit.value) {
        item = arguments['dataEdit'] as ActivityDetailData;
        topic.text = item.task?.name ?? '';
        priorityId = item.task?.priorityId ?? 0;
        objectTypeId = item.task?.objectTypeId ?? 0;
        if (item.task?.objectTypeId == TaskObjectType.ACCOUNT_OBJECT.id) {
          accountId = item.task?.accountId ?? 0;
          name.value = item.task?.accountName ?? '';
        } else if (item.task?.objectTypeId == TaskObjectType.LEAD_OBJECT.id) {
          leadId = item.task?.leadId ?? 0;
          name.value = item.task?.leadName ?? '';
        } else if (item.task?.objectTypeId == TaskObjectType.OPP_OBJECT.id) {
          opportunityId = item.task?.opportunityId ?? 0;
          name.value = item.task?.opportunityName ?? '';
        } else if (item.task?.objectTypeId == TaskObjectType.QUOTE_OBJECT.id) {
          quoteId = item.task?.quoteId ?? 0;
          name.value = item.task?.quoteName ?? '';
        } else if (item.task?.objectTypeId ==
            TaskObjectType.CONTRACT_OBJECT.id) {
          contractId = item.task?.contractId ?? 0;
          name.value =
              '${item.task?.contractNumber ?? ''} - ${item.task?.contractNumberInput ?? ''}';
        } else if (item.task?.objectTypeId == TaskObjectType.ORDER_OBJECT.id) {
          orderId = item.task?.orderId ?? 0;
          name.value = item.task?.orderNumber ?? '';
        }

        dateStart = item.task?.createDate ?? DateTime.now();
        dateStartText.text = DateUtil.formatDatetimeToString(dateStart.toUtc(),
            type: DateUtil.DATETIME_TYPE);

        deadline = item.task?.deadline ?? DateTime.now();
        deadlineText.text = DateUtil.formatDatetimeToString(deadline.toUtc(),
            type: DateUtil.DATETIME_TYPE);

        takeTypeId = item.task?.taskTypeId ?? 0;

        contactId = item.task?.contactId ?? 0;

        activityContact.value.contactName = item.task?.contactName;

        final requesterItem = item.involves?.firstWhere(
          (element) => element.role == 'REQUESTER',
          orElse: () => ActivityInvolves(),
        );

        requester.value = EmployeeModel(
          employeeFirstName: requesterItem!.involveIds![0].fullName,
          userId: requesterItem.involveIds![0].id,
        );

        if (requester.value.id != null) {
          involves.add(ActivityCreateInvolve(
            role: 'REQUESTER',
            involveIds: [requester.value.userId ?? ''],
          ));
        }

        final responsiableItems = item.involves?.firstWhere(
          (element) => element.role == 'RESPONSIBLE',
          orElse: () => ActivityInvolves(),
        );

        if (responsiableItems?.involveIds != null) {
          for (final element in responsiableItems!.involveIds!) {
            final temp = AppDataGlobal.employees.firstWhere(
                (e) => e.userId == element.id,
                orElse: () => EmployeeModel());
            if (temp.userId != null) {
              responsiable.add(temp);
            }
          }

          responsiableText.value = '';
          for (var i = 0; i < responsiable.length; i++) {
            if (i == responsiable.length - 1) {
              responsiableText.value += responsiable[i].getFullname();
            } else {
              responsiableText.value += '${responsiable[i].getFullname()},\n';
            }
          }
        }

        final participanterItems = item.involves?.firstWhere(
          (element) => element.role == 'ASSIGNEE',
          orElse: () => ActivityInvolves(),
        );

        if (participanterItems?.involveIds != null) {
          for (final element in participanterItems!.involveIds!) {
            participantes.add(EmployeeModel(
              employeeFirstName: element.fullName,
              userId: element.id,
            ));
          }

          participanterText.value = '';
          for (var i = 0; i < participantes.length; i++) {
            if (i == participantes.length - 1) {
              participanterText.value += participantes[i].getFullname();
            } else {
              participanterText.value += '${participantes[i].getFullname()},\n';
            }
          }
        }

        phoneNumber.text = item.task?.phoneNumber ?? '';

        involvedPeople.text = item.task?.involvedPeople ?? '';

        duration.text = item.task?.duration.toString() ?? '0';

        durationUnitId = item.task?.durationUnitId ?? 0;

        note.text = item.task?.description ?? '';

        print(item.toString());
      } else {
        final taskObjectType = arguments['type'] as TaskObjectType;

        objectTypeId = taskObjectType.id - 2;
        switch (taskObjectType) {
          case TaskObjectType.ACCOUNT_OBJECT:
            final account = arguments['data'] as Account;
            name.value = account.accountName ?? '';
            accountId = account.id ?? 0;
            break;
          case TaskObjectType.LEAD_OBJECT:
            final leadDetail = arguments['data'] as LeadDetail;
            name.value = leadDetail.leadName ?? '';
            leadId = leadDetail.id ?? 0;
            break;
          case TaskObjectType.OPP_OBJECT:
            final opportunityDetail = arguments['data'] as Opportunity;
            name.value = opportunityDetail.opportunityName ?? '';
            opportunityId = opportunityDetail.id ?? 0;
            break;
          default:
        }
        print(arguments.toString());
      }
    }
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      final activityCreateTask = ActivityCreateTask(
        activityTypeId: ActivityType.APPOINTMENT_OBJECT.value,
        type: 'TASK',
        startDate: DateUtil.formatDatetimeToString(dateStart.toUtc(),
            type: DateUtil.API_TYPE),
        priorityId: priorityId,
        name: topic.text,
        deadline: DateUtil.formatDatetimeToString(deadline.toUtc(),
            type: DateUtil.API_TYPE),
        taskTypeId: takeTypeId,
        contactId: contactId,
        description: note.text,
        involvedPeople: involvedPeople.text,
        duration: duration.text,
        durationUnitId: durationUnitId,
      );

      if (name.isEmpty) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'notify.activity.account.empty'.tr,
        );
        return;
      }

      if (requester.value.userId != null) {
        involves.add(ActivityCreateInvolve(
          role: 'REQUESTER',
          involveIds: [requester.value.userId ?? ''],
        ));
      }

      if (responsiable.isNotEmpty) {
        involves.add(ActivityCreateInvolve(
          role: 'RESPONSIBLE',
          involveIds:
              responsiable.map((element) => element.userId ?? '').toList(),
        ));
      }

      if (participantes.isNotEmpty) {
        involves.add(ActivityCreateInvolve(
          role: 'ASSIGNEE',
          involveIds:
              participantes.map((element) => element.userId ?? '').toList(),
        ));
      }

      if (isEdit.value) {
        activityCreateTask.objectTypeId = objectTypeId;
        if (accountId != 0 &&
            objectTypeId == TaskObjectType.ACCOUNT_OBJECT.id) {
          activityCreateTask.accountId = accountId;
          await editActivity(
            item.task?.id ?? 0,
            ActivityEditRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (leadId != 0 && objectTypeId == TaskObjectType.LEAD_OBJECT.id) {
          activityCreateTask.leadId = leadId;
          await editActivity(
            item.task?.id ?? 0,
            ActivityEditRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (opportunityId != 0 &&
            objectTypeId == TaskObjectType.OPP_OBJECT.id) {
          activityCreateTask.opportunityId = opportunityId;
          await editActivity(
            item.task?.id ?? 0,
            ActivityEditRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (quoteId != 0 && objectTypeId == TaskObjectType.QUOTE_OBJECT.id) {
          activityCreateTask.quoteId = quoteId;
          await editActivity(
            item.task?.id ?? 0,
            ActivityEditRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (contractId != 0 &&
            objectTypeId == TaskObjectType.CONTRACT_OBJECT.id) {
          activityCreateTask.contractId = contractId;
          await editActivity(
            item.task?.id ?? 0,
            ActivityEditRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (orderId != 0 && objectTypeId == TaskObjectType.ORDER_OBJECT.id) {
          activityCreateTask.orderId = orderId;
          await editActivity(
            item.task?.id ?? 0,
            ActivityEditRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }
      } else {
        if (accountId != 0 &&
            (Get.arguments != null ? objectTypeId + 2 : objectTypeId) ==
                TaskObjectType.ACCOUNT_OBJECT.id) {
          activityCreateTask.objectTypeId =
              Get.arguments != null ? objectTypeId + 2 : objectTypeId;
          activityCreateTask.accountId = accountId;
          await createActivity(
            ActivityCreateRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (leadId != 0 &&
            (Get.arguments != null ? objectTypeId + 2 : objectTypeId) ==
                TaskObjectType.LEAD_OBJECT.id) {
          activityCreateTask.objectTypeId =
              Get.arguments != null ? objectTypeId + 2 : objectTypeId;
          activityCreateTask.leadId = leadId;
          await createActivity(
            ActivityCreateRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (opportunityId != 0 &&
            (Get.arguments != null ? objectTypeId + 2 : objectTypeId) ==
                TaskObjectType.OPP_OBJECT.id) {
          activityCreateTask.objectTypeId =
              Get.arguments != null ? objectTypeId + 2 : objectTypeId;
          activityCreateTask.opportunityId = opportunityId;
          await createActivity(
            ActivityCreateRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (quoteId != 0 &&
            (Get.arguments != null ? objectTypeId + 2 : objectTypeId) ==
                TaskObjectType.QUOTE_OBJECT.id) {
          activityCreateTask.objectTypeId =
              Get.arguments != null ? objectTypeId + 2 : objectTypeId;
          activityCreateTask.quoteId = quoteId;
          await createActivity(
            ActivityCreateRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (contractId != 0 &&
            (Get.arguments != null ? objectTypeId + 2 : objectTypeId) ==
                TaskObjectType.CONTRACT_OBJECT.id) {
          activityCreateTask.objectTypeId =
              Get.arguments != null ? objectTypeId + 2 : objectTypeId;
          activityCreateTask.contractId = contractId;
          await createActivity(
            ActivityCreateRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }

        if (orderId != 0 &&
            (Get.arguments != null ? objectTypeId + 2 : objectTypeId) ==
                TaskObjectType.ORDER_OBJECT.id) {
          activityCreateTask.objectTypeId =
              Get.arguments != null ? objectTypeId + 2 : objectTypeId;
          activityCreateTask.orderId = orderId;
          await createActivity(
            ActivityCreateRequest(
              task: activityCreateTask,
              involves: involves,
            ),
          );
          return;
        }
      }
    }
  }

  Future<void> createActivity(ActivityCreateRequest request) async {
    // await EasyLoading.show();
    await crmUIRepository.createActivity(request).then((response) async {
      if (response.success) {
        // await EasyLoading.dismiss();
        Get.back(result: true);
      }
    }).catchError((onError) {
      // EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> editActivity(int id, ActivityEditRequest request) async {
    // await EasyLoading.show();
    await crmUIRepository.editActivity(id, request).then((response) async {
      if (response.success) {
        // await EasyLoading.dismiss();
        Get.back(result: true);
      }
    }).catchError((onError) {
      // EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> loadRequesterEmployee() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
        IS_MULTI_SELECT: false,
        LIST_SELECTED: [],
      })?.then((value) {
        if (value != null) {
          requester.value = value as EmployeeModel;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadParticipantes() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
        IS_MULTI_SELECT: true,
        LIST_SELECTED: participantes,
      })?.then((value) {
        if (value != null) {
          participantes.value = value as List<EmployeeModel>;
          participanterText.value = '';
          for (var i = 0; i < participantes.length; i++) {
            if (i == participantes.length - 1) {
              participanterText.value += participantes[i].getFullname();
            } else {
              participanterText.value += '${participantes[i].getFullname()},\n';
            }
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadResponsibleEmployee() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
        IS_MULTI_SELECT: true,
        LIST_SELECTED: responsiable,
      })?.then((value) {
        if (value != null && value is List<EmployeeModel>) {
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

  Future<void> loadActivityName() async {
    try {
      if (objectTypeId == TaskObjectType.ACCOUNT_OBJECT.id) {
        await Get.toNamed(
          CRMRoutes.CRM_ACTIVITY_ACCOUNT,
        )?.then((value) {
          if (value != null) {
            value as ActivityAccount;
            name.value = value.accountName ?? '';
            accountId = value.id ?? 0;
            contactId = 0;
            activityContact.value = ActivityContact();
          }
        });
      } else if (objectTypeId == TaskObjectType.LEAD_OBJECT.id) {
        await Get.toNamed(
          CRMRoutes.CRM_ACTIVITY_LEAD,
        )?.then((value) {
          if (value != null) {
            value as ActivityLead;
            name.value = value.leadName ?? '';
            leadId = value.id ?? 0;
            contactId = 0;
            activityContact.value = ActivityContact();
          }
        });
      } else if (objectTypeId == TaskObjectType.OPP_OBJECT.id) {
        await Get.toNamed(
          CRMRoutes.CRM_ACTIVITY_OPP,
        )?.then((value) {
          if (value != null) {
            value as ActivityOpp;
            name.value = value.opportunityName ?? '';
            opportunityId = value.id ?? 0;
            accountId = value.accountId ?? 0;
            contactId = 0;
            activityContact.value = ActivityContact();
          }
        });
      } else if (objectTypeId == TaskObjectType.QUOTE_OBJECT.id) {
        await Get.toNamed(
          CRMRoutes.CRM_ACTIVITY_QOUTE,
        )?.then((value) {
          if (value != null) {
            value as ActivityQoute;
            name.value = value.quoteName ?? '';
            quoteId = value.id ?? 0;
            accountId = value.accountId ?? 0;
            contactId = 0;
            activityContact.value = ActivityContact();
          }
        });
      } else if (objectTypeId == TaskObjectType.CONTRACT_OBJECT.id) {
        await Get.toNamed(
          CRMRoutes.CRM_ACTIVITY_CONTRACT,
        )?.then((value) {
          if (value != null) {
            value as ActivityContract;
            name.value =
                '${value.contractNumber} - ${value.contractNumberInput}';
            contractId = value.id ?? 0;
            accountId = value.accountId ?? 0;
            contactId = 0;
            activityContact.value = ActivityContact();
          }
        });
      } else if (objectTypeId == TaskObjectType.ORDER_OBJECT.id) {
        await Get.toNamed(
          CRMRoutes.CRM_ACTIVITY_ORDER,
        )?.then((value) {
          if (value != null) {
            value as ActivityOrder;
            name.value = value.orderNumber ?? '';
            orderId = value.id ?? 0;
            accountId = value.accountId ?? 0;
            contactId = 0;
            activityContact.value = ActivityContact();
          }
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadActivityContact() async {
    if (isEdit.value) {
      if (item.task?.objectTypeId == TaskObjectType.ACCOUNT_OBJECT.id ||
          item.task?.objectTypeId == TaskObjectType.LEAD_OBJECT.id) {
        try {
          await Get.toNamed(CRMRoutes.CRM_ACTIVITY_CONTACT,
                  arguments: accountId)
              ?.then((value) {
            if (value != null) {
              activityContact.value = value as ActivityContact;
              contactId = value.contactId ?? 0;
            }
          });
        } catch (e) {
          await EasyLoading.dismiss();
        }
      } else {
        try {
          await Get.toNamed(CRMRoutes.CRM_ACTIVITY_CONTACT,
                  arguments: item.task?.refAccountId)
              ?.then((value) {
            if (value != null) {
              activityContact.value = value as ActivityContact;
              contactId = value.contactId ?? 0;
            }
          });
        } catch (e) {
          await EasyLoading.dismiss();
        }
      }
    } else {
      if (accountId != 0) {
        try {
          await Get.toNamed(CRMRoutes.CRM_ACTIVITY_CONTACT,
                  arguments: accountId)
              ?.then((value) {
            if (value != null) {
              activityContact.value = value as ActivityContact;
              contactId = value.contactId ?? 0;
            }
          });
        } catch (e) {
          await EasyLoading.dismiss();
        }
      }
    }
  }

  Future<void> selectDate(TextEditingController field, bool isStartDate) async {
    await showDatePicker(
      context: Get.context!,
      initialDate: isStartDate ? dateStart : deadline,
      firstDate: isStartDate ? DateTime(2000) : dateStart,
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
      showTimePicker(
        context: Get.context!,
        initialTime: isStartDate
            ? TimeOfDay.now()
            : const TimeOfDay(hour: 23, minute: 59),
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
      ).then((time) {
        if (date != null && time != null) {
          if (isStartDate) {
            dateStart = DateTime(date.year, date.month, date.day, time.hour,
                time.minute, time.minute, 0);
            if (dateStart.isAfter(deadline)) {
              deadline = dateStart;
              deadlineText.text = DateUtil.formatDatetimeToString(
                  deadline.toUtc(),
                  type: DateUtil.DATETIME_TYPE);
            }
            field.text = DateUtil.formatDatetimeToString(dateStart.toUtc(),
                type: DateUtil.DATETIME_TYPE);
          } else {
            deadline = DateTime(date.year, date.month, date.day, time.hour,
                time.minute, time.minute, 0);
            field.text = DateUtil.formatDatetimeToString(deadline.toUtc(),
                type: DateUtil.DATETIME_TYPE);
          }
        }
      });
    });
  }
}
