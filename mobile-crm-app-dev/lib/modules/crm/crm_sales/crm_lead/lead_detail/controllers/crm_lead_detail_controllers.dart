import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
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

class CrmLeadDetailController extends BaseController {
  final listActivity = RxList<ActivityContent>([]);

  ActivityRequest request = ActivityRequest();

  final leadDetail = Rxn<LeadDetail>();

  DateTime dateStart = DateTime.now();
  DateTime dateDone = DateTime.now();
  final dateStartText = TextEditingController();
  final dateDoneText = TextEditingController();

  /* Init */

  CrmLeadDetailController() {
    leadDetail.value = Get.arguments as LeadDetail;

    request = ActivityRequest.lead(leadDetail.value?.id);
    if (AppDataGlobal.userConfig?.menuActions
            ?.crmServiceSaleManagementSaleActivity?.viewTask !=
        null) {
      getActivities(0);
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (leadDetail.value == null) {
      Get.back();
    }
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
        onConvertTap:
            (leadDetail.value?.isDone() ?? false) ? null : onConvertLead,
        onDeleteTap:
            (leadDetail.value?.isDone() ?? false) ? null : onDeleteLead,
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
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'Xóa Khách hàng tiềm năng',
      message:
          'Bạn có chắc chắn muốn xóa khách hàng tiềm năng? Khách hàng tiềm năng sẽ bị xóa vĩnh viễn.',
      confirmTitle: 'Xóa',
      onConfirm: () => _callDeleteLead(leadDetail.value?.id ?? 0),
    );
  }

  Future onEditStatus() async {
    await Get.toNamed(CRMRoutes.CRM_EDIT_LEAD_STATUS,
            arguments: leadDetail.value)
        ?.then((value) {
      if (value != null && value is LeadDetail) {
        leadDetail.value = value;
        leadDetail.refresh();
      }
    });
  }

  Future onEditInfo() async {
    await Get.toNamed(CRMRoutes.CRM_EDIT_LEAD_INFO, arguments: leadDetail.value)
        ?.then((value) {
      if (value != null && value is LeadDetail) {
        leadDetail.value = value;
        leadDetail.refresh();
      }
    });
  }

  Future onEditAddress() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_DETAIL_ADDRESS_EDIT,
            arguments: leadDetail.value)
        ?.then((value) {
      if (value != null && value is LeadDetail) {
        leadDetail.value = value;
        leadDetail.refresh();
      }
    });
  }

  Future onProductsInterest() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_PRODUCTS, arguments: leadDetail.value);
  }

  Future onEditAdditionInfo() async {
    await Get.toNamed(CRMRoutes.CRM_EDIT_LEAD_ADDITION_INFO,
            arguments: leadDetail.value)
        ?.then((value) {
      if (value != null && value is LeadDetail) {
        leadDetail.value = value;
        leadDetail.refresh();
      }
    });
  }

  Future<void> onPhoneAction() async {
    final phoneUri =
        Uri(scheme: 'tel', path: leadDetail.value?.leadPhone ?? '');
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

  /* Call API */

  Future<void> _callGetLeadDetail() async {
    await EasyLoading.show();
    await crmUIRepository
        .getLeadDetail(leadDetail.value?.id ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        leadDetail.value = response.data;
        leadDetail.refresh();
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

  /* Function */

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
                    'data': leadDetail
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0);
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
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0);
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
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0);
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
                    'type': TaskObjectType.LEAD_OBJECT,
                    'data': leadDetail
                  })?.then((value) {
                if (value != null && value) {
                  if (AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                      null) {
                    getActivities(0);
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

  String getTextPriority(int id) {
    for (var i = 0;
        i < AppDataGlobal.crmMasterData!.listPriority!.length;
        i++) {
      if (AppDataGlobal.crmMasterData?.listPriority?[i].id == id) {
        return AppDataGlobal.crmMasterData?.listPriority?[i].priorityName ?? '';
      }
    }
    return '';
  }
}
