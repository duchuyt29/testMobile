import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../all_product/bindings/crm_all_product_binding.dart';
import '../../all_product/views/crm_all_product_page.dart';

class CrmProductController extends GetxController {
  /* Action */

  Future<void> onViewAllProduct(BuildContext context) async {
    await Navigator.push(
      context,
      GetPageRoute(
        page: () => CrmAllProductPage(),
        binding: CrmAllProductBinding(),
      ),
    );
  }
}
