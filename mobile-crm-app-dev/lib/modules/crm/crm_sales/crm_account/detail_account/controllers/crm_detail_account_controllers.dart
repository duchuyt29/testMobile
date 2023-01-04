import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/activity/activity_condition.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/request/activity_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_action.dart';

class CrmDetailAccountController extends BaseController {
  final listActivity = RxList<ActivityContent>([]);
  final accountInfo = Rxn<AccountInfo>();

  ActivityRequest request = ActivityRequest();

  Rx<Account> account = Rx(Account());
  CrmDetailAccountController() {
    account.value = Get.arguments;
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
                fieldName: 'account_id',
                fieldType: 'LONG',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [account.value.id],
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
                values: [TaskObjectType.ACCOUNT_OBJECT.id],
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
      getActivities(0, request);
    }

    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await crmUIRepository
          .getAccountDetail(account.value.id ?? 0)
          .then((response) async {
        if (response.success && response.data != null) {
          accountInfo.value = response.data!;
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

  Future<void> onViewAccountDetailDetail() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_DETAIL_DETAIL,
        arguments: account.value);
  }

  Future<void> onDeleteItem() async {
    try {
      await crmUIRepository
          .deleteAccount(account.value.id ?? 0)
          .then((response) async {
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

  Future<void> showCreateModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: account.value.isActive == 1
          ? WidgetCrmMenuAction(
              onAddActivity: AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.createTask !=
                      null
                  ? showCreateActivityModalBottomSheet
                  : null,
              onLockTap: () {
                onLockAccount(account.value);
              },
            )
          : WidgetCrmMenuAction(
              onAddActivity: showCreateActivityModalBottomSheet,
              onUnLockTap: () {
                onLockAccount(account.value);
              },
            ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  Future<void> onDeleteAccount() async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.account.delete.account'.tr,
      message: 'crm.account.delete_confirm'.tr,
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem();
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
                  style: AppTextStyle.bold(fontSize: 18)),
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
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB,
                  arguments: {
                    'type': TaskObjectType.ACCOUNT_OBJECT,
                    'data': account.value
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
              height: 1,
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
                    'type': TaskObjectType.ACCOUNT_OBJECT,
                    'data': account.value
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
              height: 1,
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
                    'type': TaskObjectType.ACCOUNT_OBJECT,
                    'data': account.value
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
              height: 1,
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
                    'type': TaskObjectType.ACCOUNT_OBJECT,
                    'data': account.value
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
              height: 1,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: Get.back,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.grey.shade300),
                //   borderRadius: BorderRadius.circular(15),
                // ),
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

  Future<void> onLockAccount(Account item) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title:
          item.isActive == 1 ? 'crm.account.lock'.tr : 'crm.account.unlock'.tr,
      message: item.isActive == 1
          ? 'crm.account.lock_confirm'.tr
          : 'crm.account.unlock_confirm'.tr,
      confirmTitle: 'confirm'.tr,
      onConfirm: () {
        _onValidateLock(item);
      },
    );
  }

  Future<void> _onValidateLock(Account item) async {
    try {
      if (item.isActive == 1) {
        await crmUIRepository
            .getAccountCount(item.id ?? 0)
            .then((response) async {
          if (response.success) {
            final isUsed = response.data?.isUsed ?? 0;
            if (isUsed > 0) {
              await DialogUtil.createDialogMessage(
                  title: 'notify.title'.tr,
                  message:
                      'Tài khoản đang trong giao dịch, không thể khoá.'.tr);
            } else {
              await _onLockAccount(item.id ?? 0);
            }
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
      } else {
        await _onLockAccount(item.id ?? 0);
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _onLockAccount(int id) async {
    try {
      await crmUIRepository.lockAccount(id).then((response) async {
        if (response.success) {
          await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: 'notify.success'.tr,
            onPressed: _loadData,
          );
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

  Future<void> onPhoneAction(AccountInfo? item) async {
    final phoneUri = Uri(scheme: 'tel', path: item?.accountPhone ?? '');
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
}
