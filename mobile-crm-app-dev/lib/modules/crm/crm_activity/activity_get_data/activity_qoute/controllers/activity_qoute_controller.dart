import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_lead.dart';
import 'package:ui_api/crm_api/models/activity/activity_qoute.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class ActivtyQouteController extends BaseController {
  final activityQoutes = RxList<ActivityQoute>();
  String? countryCode;

  String searchText = '';
  final filterData = RxList<ActivityQoute>();

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      await crmUIRepository.getActivityQoute().then((response) async {
        if (response.success) {
          activityQoutes.addAll(response.data ?? List.empty());
          filterData.value = activityQoutes;
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

  Future<void> onChange(ActivityQoute? item) async {
    try {
      Get.back(result: item);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = activityQoutes;
    } else {
      filterData.value = activityQoutes
          .where((element) => element.quoteName?.contains(searchText) ?? false)
          .toList();
    }
  }
}
