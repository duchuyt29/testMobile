import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/product/product_price.dart';

import '../../../../../../../base/base_controller.dart';

class OpportunityProductPriceController extends BaseController {
  final productList = RxList<ProductPrice>([]);
  String searchText = '';
  final filterProduct = RxList<ProductPrice>();

  OpportunityProductPriceController() {
    productList.value = Get.arguments ?? [];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    onSearchProduct(searchText);
  }

  void onSearchProduct(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterProduct.value = productList;
    } else {
      filterProduct.value = productList
          .where((element) => element.isCompare(searchText))
          .toList();
    }
  }
}
