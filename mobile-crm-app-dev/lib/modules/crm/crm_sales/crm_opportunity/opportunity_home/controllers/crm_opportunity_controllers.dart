import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_filter_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class CrmOpportunityController extends BaseController {
  final searchController = TextEditingController();
  String _searchText = '';

  OpportunityFilterRequest filter = OpportunityFilterRequest();

  final refreshController = RefreshController();
  final opportunities = RxList<Opportunity>.empty();
  final isMore = RxBool(true);
  int _page = 0;

  CrmOpportunityController();

  @override
  Future<void> onInit() async {
    await super.onInit();
    if (AppDataGlobal.userConfig?.menuActions
            ?.crmServiceSaleManagementSaleOpporturnity?.view !=
        null) {
      onRefresh();
    }
  }

  // Action

  void onSearchAction(String searchText) {
    if (searchText == _searchText) {
      return;
    }

    _searchText = searchText;
    onRefresh();
  }

  Future<void> onViewOpportunityDetail({
    required Opportunity opportunity,
  }) async {
    await Get.toNamed(
      CRMRoutes.CRM_OPPORTUNITY_DETAIL,
      arguments: opportunity,
    )?.then((value) => onRefresh());
  }

  Future<void> onViewAddOpportunity() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_FORM)!.then((value) {
      if (value != null) {
        onRefresh();
      }
    });
  }

  Future<void> onViewFilter() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_FILTER, arguments: filter)
        ?.then((value) {
      if (value != null && value is OpportunityFilterRequest) {
        filter = value;
        onRefresh();
      }
    });
  }

  void onRefresh() => _loadData(0);
  void onLoading() => _loadData(_page + 1);

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

  // Call API
  Future<void> _loadData(int page) async {
    await EasyLoading.show();
    await crmUIRepository
        .getOpportunities(_page, CommonConstants.defaultSize,
            CommonConstants.sortId, _searchText, filter)
        .then((response) async {
      if (response.success) {
        _updateRefreshController(page);
        if (page == 0) {
          opportunities.clear();
        }
        _page = page;
        opportunities.addAll(response.data?.content ?? []);
        isMore.value = response.data?.isMore() ?? false;
      } else {
        _updateRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message ?? '');
        }
      }
      await EasyLoading.dismiss();
    }).catchError((onError) {
      _updateRefreshController(page, isError: true);
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  // Delete Opportunity
  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteOpportunityById(id).then((response) async {
        if (response.success) {
          onRefresh();
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

  Future<void> showCreateActivityModalBottomSheet(Opportunity item) async {
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
              onTap: () =>
                  Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB, arguments: {
                'type': TaskObjectType.OPP_OBJECT,
                'data': Opportunity(
                  id: item.id,
                  opportunityName: item.opportunityName,
                )
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
                    'data': Opportunity(
                      id: item.id,
                      opportunityName: item.opportunityName,
                    )
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
                    'data': Opportunity(
                      id: item.id,
                      opportunityName: item.opportunityName,
                    )
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
                    'data': Opportunity(
                      id: item.id,
                      opportunityName: item.opportunityName,
                    )
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
