import 'package:get/get.dart';

import '../controllers/notification_setting_controller.dart';

class NotificationSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationSettingController>(
      () => NotificationSettingController(),
    );
  }
}
