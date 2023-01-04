import 'package:get/get.dart';

import '../controllers/product_management_controllers.dart';

class ProductManagementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductManagementController>(
      () => ProductManagementController(),
    );
  }
}
