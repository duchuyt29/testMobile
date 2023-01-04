import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/currency_exchange_rate.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';

class CrmAllCurrencyExchangeRateController extends BaseController {
  final currencyExchangeRateList = RxList<CurrencyExchangeRate>([]);
  @override
  final crmMasterData = AppDataGlobal.crmMasterData;

  final selectedCurrencyExchangeRate =
      Rx<CurrencyExchangeRate>(CurrencyExchangeRate());

  CrmAllCurrencyExchangeRateController() {
    currencyExchangeRateList
        .addAll(crmMasterData?.listCurrencyExchangeRate ?? []);
    if (Get.arguments != null) {
      selectedCurrencyExchangeRate.value = currencyExchangeRateList.firstWhere(
          (element) => element.id == Get.arguments,
          orElse: () => CurrencyExchangeRate());
    }
  }

  void onSearch(String? text) {
    if (text != null) {
      currencyExchangeRateList.clear();
      currencyExchangeRateList.addAll(crmMasterData!.listCurrencyExchangeRate!
          .where((element) => element.isCompare(text))
          .toList());
    }
  }

  void onSelectedCurrencyExchangeRate(
      CurrencyExchangeRate currencyExchangeRate) {
    selectedCurrencyExchangeRate.value = currencyExchangeRate;
    Get.back(result: currencyExchangeRate);
  }
}
