import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/district.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class CrmAddressDistrictController extends BaseController {
  int? provinceId;
  int? initialValue;

  List<District> districts = [];

  String searchText = '';
  final filterDistricts = RxList<District>();

  /* Init */

  CrmAddressDistrictController() {
    final arguments = Get.arguments as Map;
    provinceId = arguments[PROVINCE_ID];
    initialValue = arguments[DISTRICT_ID];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadData(provinceId ?? 0);
  }

  /* Action */

  Future<void> onChange(District district) async {
    initialValue = district.id;
    filterDistricts.refresh();
    Get.back(result: district);
  }

  void onSearchDistrict(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterDistricts.value = districts;
    } else {
      filterDistricts.value =
          districts.where((element) => element.isCompare(searchText)).toList();
    }
  }

  /* Call API */

  Future<void> loadData(int provinceId) async {
    await EasyLoading.show();
    await crmUIRepository.getDistrict(provinceId).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        districts = response.data ?? [];
        onSearchDistrict(searchText);
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
