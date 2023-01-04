import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class OpportunityDetailInfoController extends BaseController {
  final opportunity = Rx<Opportunity>(Opportunity());
  final opportunityInfo = Rxn<OpportunityInfo>();

  OpportunityDetailInfoController() {
    opportunity.value = Get.arguments as Opportunity;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadData();
  }

  // ACTION

  Future<void> onViewStatusInfoForm() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_STATUS_INFO_FORM,
            arguments: opportunityInfo.value)
        ?.then((value) async {
      if (value != null) {
        await _loadData();
      }
    });
  }

  Future<void> onViewInfoForm() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_INFO_FORM,
            arguments: opportunityInfo.value)
        ?.then((value) async {
      if (value != null) {
        await _loadData();
      }
    });
  }

  Future<void> onViewAdditionalForm() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_ADDITIONAL_FORM,
            arguments: opportunityInfo.value)
        ?.then((value) async {
      if (value != null) {
        await _loadData();
      }
    });
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

  // Delete Opportunity
  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteOpportunityById(id).then((response) async {
        if (response.success) {
          Get.back(result: true);
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
                  // getActivities(0, request);
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
                  // getActivities(0, request);
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
                  // getActivities(0, request);
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
                  // getActivities(0, request);
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
