import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/network_controller.dart';

abstract class NetworkManager {
  // Note: add bindings to Controller:
  //Get.lazyPut<NetworkController>(() => NetworkController());

  Future<bool> hasConnectNetwork() async {
    final _networkController = Get.find<NetworkController>();
    if (_networkController.connectionStatus.value != WIFI_NETWORK &&
        _networkController.connectionStatus.value != MOBILE_NETWORK &&
        _networkController.connectionStatus.value != INSTANCE_NETWORK) {
      return false;
    } else {
      return true;
    }
  }
}
