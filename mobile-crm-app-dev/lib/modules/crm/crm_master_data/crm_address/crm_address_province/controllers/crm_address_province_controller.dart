import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/province.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/dialog_util.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class CrmAddressProvinceController extends BaseController {
  String? countryId;
  int? initialValue;

  List<Province> provinces = [];

  String searchText = '';
  final filterProvinces = RxList<Province>();

  /* Init */

  CrmAddressProvinceController() {
    final arguments = Get.arguments as Map;
    countryId = arguments[COUNTRY_ID];
    initialValue = arguments[PROVINCE_ID];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _loadData(countryId ?? 'VN');
  }

  /* Action */

  Future<void> onChange(Province province) async {
    initialValue = province.id;
    filterProvinces.refresh();
    Get.back(result: province);
  }

  void onSearchProvince(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterProvinces.value = provinces;
    } else {
      filterProvinces.value =
          provinces.where((element) => element.isCompare(searchText)).toList();
    }
  }

  /* Call API */

  Future _loadData(String countryId) async {
    await EasyLoading.show();
    await crmUIRepository.getProvince(countryId).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        provinces = response.data ?? [];
        onSearchProvince(searchText);
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
