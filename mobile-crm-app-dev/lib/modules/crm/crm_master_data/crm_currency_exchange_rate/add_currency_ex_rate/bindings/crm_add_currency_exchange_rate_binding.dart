import 'package:get/get.dart';

import '../controllers/crm_add_currency_exchange_rate_controller.dart';

class CrmAddCurrencyExchangeRateBinding extends Bindings {
  @override
  void dependencies() {
    final addCurrencyExchangeRateController =
        CrmAddCurrencyExchangeRateController();
    Get.lazyPut<CrmAddCurrencyExchangeRateController>(
        () => addCurrencyExchangeRateController);
  }
}
