import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class ProductsFilterController extends BaseController {
  final RxBool isMultiSelect = false.obs;
  int? initialValue;

  List<Product> products = [];
  RxList<Product> listSelect = RxList.empty(growable: true);

  String searchText = '';
  final filterData = RxList<Product>();

  /* Init */

  ProductsFilterController() {
    _loadData();
    if (Get.arguments != null) {
      final arguments = Get.arguments as Map;
      initialValue = arguments[PRODUCT_ID];
      if (arguments[PRODUCT_LIST] != null) {
        listSelect.value = arguments[PRODUCT_LIST];
      }
      if (arguments[IS_MULTI_SELECT] != null) {
        isMultiSelect.value = arguments[IS_MULTI_SELECT];
      }
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  /* Action */

  Future<void> onChange(Product item) async {
    if (isMultiSelect.value) {
      if (!listSelect.any((element) => element.id == item.id)) {
        listSelect.add(item);
      } else {
        listSelect.removeAt(
            listSelect.indexWhere((element) => element.id == item.id));
      }
      listSelect.refresh();
    } else {
      initialValue = item.id;
      filterData.refresh();
      Get.back(result: item);
    }
  }

  Future<void> onChangeList() async {
    try {
      Get.back(result: listSelect.value);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = products;
    } else {
      filterData.value =
          products.where((element) => element.isCompare(searchText)).toList();
    }
  }

  /* Call API */

  Future _loadData() async {
    await EasyLoading.show();
    await crmUIRepository.getAllProducts().then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        products = response.data ?? [];
        onSearch(searchText);
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
