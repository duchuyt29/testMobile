import 'package:get/get.dart';

import '../../crm_currency_exchange_rate/crm_currency_exchange_rate/controllers/currency_exchange_rate_controller.dart';
import '../controllers/settings_controllers.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    final settingsController = SettingsController();
    Get.lazyPut<SettingsController>(() => settingsController);
  }
}
