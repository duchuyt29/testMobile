import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class CrmAddressWardController extends BaseController {
  int? districtId;
  int? initialValue;

  List<Ward> wards = [];

  String searchText = '';
  final filterWards = RxList<Ward>();

  /* Init */

  CrmAddressWardController() {
    final arguments = Get.arguments as Map;
    districtId = arguments[DISTRICT_ID];
    initialValue = arguments[WARD_ID];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await loadData(districtId ?? 0);
  }

  /* Action */

  Future<void> onChange(Ward ward) async {
    initialValue = ward.id;
    filterWards.refresh();
    Get.back(result: ward);
  }

  void onSearchWard(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterWards.value = wards;
    } else {
      filterWards.value =
          wards.where((element) => element.isCompare(searchText)).toList();
    }
  }

  /* Call API */

  Future<void> loadData(int parentId) async {
    await EasyLoading.show();
    await crmUIRepository.getWard(parentId).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        wards = response.data ?? [];
        onSearchWard(searchText);
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
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
        onPressed: Get.back,
      );
    });
  }
}
