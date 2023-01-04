import 'package:get/get.dart';

import '../shared/network/controllers/network_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
