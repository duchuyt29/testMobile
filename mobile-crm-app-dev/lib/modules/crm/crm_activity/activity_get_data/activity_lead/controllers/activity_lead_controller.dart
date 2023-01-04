import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/activity/activity_lead.dart';
import 'package:ui_api/crm_api/models/common/province.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class ActivtyLeadController extends BaseController {
  final activityLeads = RxList<ActivityLead>();
  String? countryCode;

  String searchText = '';
  final filterData = RxList<ActivityLead>();

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      await crmUIRepository.getActivityLead().then((response) async {
        if (response.success) {
          activityLeads.addAll(response.data ?? List.empty());
          filterData.value = activityLeads;
        } else {
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

  Future<void> onChange(ActivityLead? item) async {
    try {
      Get.back(result: item);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = activityLeads;
    } else {
      filterData.value = activityLeads
          .where((element) => element.leadName?.contains(searchText) ?? false)
          .toList();
    }
  }
}
