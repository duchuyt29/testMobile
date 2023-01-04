import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/lead/lead_model.dart';
import 'package:ui_api/crm_api/request/activity_request.dart';
import 'package:ui_api/crm_api/request/lead/lead_filter_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class CrmAllLeadController extends BaseController {
  final searchController = TextEditingController();
  String _searchText = '';
  final lead = Rxn<LeadModel>();
  final leadDetail = Rxn<LeadDetail>();
  ActivityRequest request = ActivityRequest();
  final listActivity = RxList<ActivityContent>();

  final currentStage = RxInt(0);

  LeadFilterRequest filter = LeadFilterRequest();

  final refreshController = RefreshController();
  final leadModels = RxList<LeadModel>();
  final isLoading = RxBool(true);
  final isMore = RxBool(true);
  int _page = 0;

  /* Init */

  CrmAllLeadController();

  @override
  Future<void> onInit() async {
    await super.onInit();

    onRefresh();
  }

  /* Action */

  void onSearchAction(String searchText) {
    if (searchText == _searchText) {
      return;
    }

    _searchText = searchText;
    isLoading.value = true;
    onRefresh();
  }

  Future<void> onCreateLead() async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_LEAD)?.then((value) {
      if (value != null && value) {
        onRefresh();
      }
    });
  }

  Future<void> onSearchFilter() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_FILTER, arguments: filter)
        ?.then((value) {
      if (value != null && value is LeadFilterRequest) {
        filter = value;
        isLoading.value = true;
        onRefresh();
      }
    });
  }

  Future<void> onViewLeadDetail(LeadModel lead) async {
    await Get.toNamed(CRMRoutes.CRM_OVERVIEW_LEAD, arguments: lead)
        ?.then((value) {
      if (value != null) {
        if (value is String) {
          EasyLoading.showToast(value);
          onRefresh();
        } else if (value is LeadDetail) {
          final index =
              leadModels.indexWhere((element) => value.id == element.id);
          if (index != -1) {
            leadModels[index] = value.getLead();
            leadModels.refresh();
          }
        }
      }
    });
  }

  Future<void> onPhoneAction(String phoneNumber) async {
    final phoneUri = Uri(scheme: 'tel', path: phoneNumber);
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

  void onAddAction() => showCreateActivityModalBottomSheet();

  Future<void> onConvertLead(LeadModel leadModel) async {
    final leadDetail = await _callGetLeadDetail(leadModel);
    if (leadDetail == null) {
      return;
    }
    await Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD, arguments: leadDetail)
        ?.then((value) {
      if (value != null && value) {
        onRefresh();
      }
    });
  }

  void onDeleteLead(LeadModel leadModel) {
    if (leadModel.id == null) {
      EasyLoading.showToast('Không được xóa khách hàng này!');
      return;
    }
    BottomSheetUtil.createConfirmBottomSheet(
      title: 'Xoá khách hàng tiềm năng',
      message:
          'Bạn có chắc muốn xoá khách hàng tiềm năng này?\nKhách hàng tiềm năng sẽ bị xoá vĩnh viễn!',
      confirmTitle: 'delete'.tr,
      onConfirm: () => _callDeleteLead(leadModel.id!),
    );
  }

  /* Function */

  void onRefresh() => _callGetLeads(0);
  void onLoading() => _callGetLeads(_page + 1);

  void _updateRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? refreshController.refreshFailed()
          : refreshController.refreshCompleted();
    } else {
      isError
          ? refreshController.loadFailed()
          : refreshController.loadComplete();
    }
  }

  // Call API

  Future<void> _callGetLeads(int page) async {
    await crmUIRepository
        .getLeads(_page, CommonConstants.defaultSize, CommonConstants.sortId,
            _searchText, filter)
        .then((response) async {
      if (response.success) {
        _updateRefreshController(page);
        if (page == 0) {
          leadModels.clear();
        }
        _page = page;
        leadModels.addAll(response.data?.content ?? []);
        isMore.value = response.data?.isMore() ?? false;
      } else {
        _updateRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message ?? '');
        }
      }
      isLoading.value = false;
    }).catchError((onError) {
      _updateRefreshController(page, isError: true);
      isLoading.value = false;
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<LeadDetail?> _callGetLeadDetail(LeadModel leadModel) async {
    await EasyLoading.show();
    return crmUIRepository
        .getLeadDetail(leadModel.id ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        return response.data;
      } else {
        return null;
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      return null;
    });
  }

  Future<void> _callDeleteLead(int id) async {
    await EasyLoading.show();
    await crmUIRepository.deleteLead(id).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        await EasyLoading.showToast('Xóa thành công!');
        onRefresh();
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
}
