import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_contact.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class ActivityContactController extends BaseController {
  final activityContacts = RxList<ActivityContact>();
  int? id;

  String searchText = '';
  final filterData = RxList<ActivityContact>();

  ActivityContactController() {
    id = Get.arguments;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadData(id ?? 0);
  }

  Future<void> loadData(int id) async {
    try {
      await crmUIRepository.getActivityContact(id).then((response) async {
        if (response.success) {
          activityContacts.addAll(response.data ?? List.empty());
          filterData.value = activityContacts;
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

  Future<void> onChange(ActivityContact? item) async {
    try {
      Get.back(result: item);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = activityContacts;
    } else {
      filterData.value = activityContacts
          .where(
              (element) => element.contactName?.contains(searchText) ?? false)
          .toList();
    }
  }
}
