import 'package:get/get.dart';

import '../controllers/crm_all_curren_exchange_controller.dart';

class CrmAllCurrencyExchangeRateBinding extends Bindings {
  @override
  void dependencies() {
    final allCurrencyExchangeRateController =
        CrmAllCurrencyExchangeRateController();
    Get.lazyPut<CrmAllCurrencyExchangeRateController>(
        () => allCurrencyExchangeRateController);
  }
}
