import 'package:get/get.dart';

import '../../account/account/controllers/account_controller.dart';
import '../../conversation/conversations/controllers/conversations_controller.dart';
import '../../home/home/controllers/home_controller.dart';
import '../../microservices/controllers/microservice_controllers.dart';
import '../../notification/notification/controllers/notification_controller.dart';
import '../controllers/master_controller.dart';

class MasterBinding extends Bindings {
  @override
  void dependencies() {
    final masterController = MasterController();
    Get.lazyPut<MasterController>(() => masterController);
    Get.lazyPut<HomeController>(() => HomeController(masterController));
    Get.lazyPut<ConversationsController>(
        () => ConversationsController(masterController));
    Get.lazyPut<NotificationController>(
        () => NotificationController(masterController));
    Get.lazyPut<AccountController>(() => AccountController(masterController));
    Get.lazyPut<MicroserviceController>(
        () => MicroserviceController(masterController));
  }
}
