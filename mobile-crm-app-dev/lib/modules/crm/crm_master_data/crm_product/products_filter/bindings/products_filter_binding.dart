import 'package:get/get.dart';

import '../controllers/products_filter_controller.dart';

class CrmProductsFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsFilterController>(
      () => ProductsFilterController(),
    );
  }
}
