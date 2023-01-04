import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmLeadProductsEditController extends BaseController {
  List<Product> products = AppDataGlobal.products;

  String searchText = '';
  final filterProducts = RxList<Product>();
  List<Product> selectedProducts = RxList<Product>();

  /* Init */

  CrmLeadProductsEditController() {
    selectedProducts = Get.arguments ?? [];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (products.isEmpty) {
      await loadData();
    } else {
      onSearchProduct(searchText);
    }
  }

  /* Action */

  void onSearchProduct(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterProducts.value = products;
    } else {
      filterProducts.value =
          products.where((element) => element.isCompare(searchText)).toList();
    }
  }

  Future<void> onSelectProduct(Product product) async {
    final index =
        selectedProducts.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      selectedProducts.add(product);
    } else {
      selectedProducts.removeAt(index);
    }
    filterProducts.refresh();
  }

  Future onCancel() async => Get.back();

  Future onSubmitted() async => Get.back(result: selectedProducts);

  /* Call API */

  Future<void> loadData() async {
    await EasyLoading.show();
    await crmUIRepository.getAllProducts().then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.products = response.data ?? [];
        products = response.data ?? [];
        onSearchProduct(searchText);
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

  // Future<void> _updateLead() async {
  //   await crmUIRepository
  //       .updateLead(leadDetail?.id ?? 0, leadDetail!)
  //       .then((response) async {
  //     if (response.success) {
  //       Get.back(result: true);
  //     } else {
  //       await EasyLoading.dismiss();
  //       await DialogUtil.createDialogMessage(
  //         title: 'notify.title'.tr,
  //         message: response.message ?? 'notify.error'.tr,
  //         onPressed: Get.back,
  //       );
  //     }
  //   }).catchError((onError) {
  //     EasyLoading.dismiss();

  //     DialogUtil.createDialogMessage(
  //         title: 'notify.title'.tr, message: 'notify.error'.tr);
  //   });
  // }
}
