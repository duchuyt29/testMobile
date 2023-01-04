import 'package:get/get.dart';

import '../../../../../../routes/crm_pages.dart';

class CrmCurrencyExchangeRateController extends GetxController {
  // final SettingsController settingsController;

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final language = RxString('language'.tr);
  // CurrencyExchangeRateController(this.settingsController);

  Future<void> onViewAllCurrenExRate() async {
    await Get.toNamed(CRMRoutes.ALL_CURRENCY_EXCHANGE_RATE);
  }
}
