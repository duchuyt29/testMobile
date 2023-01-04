import 'package:get/get.dart';

import '../../all_currency_ex_rate/controllers/crm_all_curren_exchange_controller.dart';
import '../controllers/currency_exchange_rate_controller.dart';

class CrmCurrencyExchangeRateBinding extends Bindings {
  @override
  void dependencies() {
    final currencyExchangeRateController = CrmCurrencyExchangeRateController();
    Get.lazyPut<CrmCurrencyExchangeRateController>(
        () => currencyExchangeRateController);
  }
}
