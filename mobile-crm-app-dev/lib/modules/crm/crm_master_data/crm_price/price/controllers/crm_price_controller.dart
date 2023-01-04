import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/price.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/arguments.dart';

class CrmPriceController extends BaseController {
  final RxBool isMultiSelect = false.obs;

  final RxList<int> listSelect = RxList.empty(growable: true);
  RxString type = ''.obs;

  CrmPriceController() {
    isMultiSelect.value = Get.arguments[IS_MULTI_SELECT] ?? false;
    type.value = Get.arguments['type'] ?? '';
    final temp = Get.arguments['listSelect'];
    if (temp != null && temp.isNotEmpty) {
      for (var i = 0; i < temp.length; i++) {
        listSelect.add(AppDataGlobal.crmMasterData!.listPrice!
            .indexWhere((element) => element.id == temp[i].id));
      }
    }
  }

  Future<void> onChange(Price? item) async {
    try {
      // initialValue = item?.id;
      Get.back(result: item);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onChangeList(List<Price?> items) async {
    try {
      // initialValue = item?.id;
      Get.back(result: items);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
