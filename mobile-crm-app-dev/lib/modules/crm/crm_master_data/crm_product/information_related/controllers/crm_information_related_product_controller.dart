import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../base/base_controller.dart';
import '../information_related_form/add_price_form/bindings/crm_add_price_form_binding.dart';
import '../information_related_form/add_price_form/views/crm_add_price_form_page.dart';
import '../information_related_form/add_price_standard_form/bindings/crm_add_price_standard_form_binding.dart';
import '../information_related_form/add_price_standard_form/views/crm_add_price_standard_form_page.dart';

class CrmInformationRelatedProductController extends BaseController {
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  Future<void> onViewAddPrice() async {
    await Navigator.push(
      Get.context!,
      GetPageRoute(
        page: () => CrmAddPriceFormPage(),
        binding: CrmAddPriceFormBindings(),
      ),
    );
  }

  Future<void> onViewAddPriceStandard() async {
    await Navigator.push(
      Get.context!,
      GetPageRoute(
        page: () => CrmAddPriceStandardFormPage(),
        binding: CrmAddPriceStandardFormBindings(),
      ),
    );
  }
}
