import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/common/province.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class ActivtyAccountController extends BaseController {
  RxList<ActivityAccount> activityAccounts = RxList<ActivityAccount>();
  String? countryCode;

  String searchText = '';
  final filterData = RxList<ActivityAccount>();

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      await crmUIRepository.getActivityAccount().then((response) async {
        if (response.success) {
          activityAccounts.addAll(response.data ?? List.empty());
          filterData.value = activityAccounts;
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

  Future<void> onChange(ActivityAccount? item) async {
    try {
      Get.back(result: item);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = activityAccounts;
    } else {
      filterData.value = activityAccounts
          .where(
              (element) => element.accountName?.contains(searchText) ?? false)
          .toList();
    }
  }
}
