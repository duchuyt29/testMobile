import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_contract.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class ActivtyContractController extends BaseController {
  final activityContracts = RxList<ActivityContract>();
  String? countryCode;

  String searchText = '';
  final filterData = RxList<ActivityContract>();

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      await crmUIRepository.getActivityContract().then((response) async {
        if (response.success) {
          activityContracts.addAll(response.data ?? List.empty());
          filterData.value = activityContracts;
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

  Future<void> onChange(ActivityContract? item) async {
    try {
      Get.back(result: item);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = activityContracts;
    } else {
      filterData.value = activityContracts
          .where((element) =>
              element.contractNumber?.contains(searchText) ?? false)
          .toList();
    }
  }
}
