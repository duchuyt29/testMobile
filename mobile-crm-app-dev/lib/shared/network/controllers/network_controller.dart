import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  RxInt connectionStatus = RxInt(INSTANCE_NETWORK);

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<int> checkConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
      print('Result None connect Network: $result');
    } on PlatformException catch (e) {
      print(e.toString());
      result = null;
    }

    return _updateConnectionStatus(result);
  }

  int _updateConnectionStatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = WIFI_NETWORK;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = MOBILE_NETWORK;
        break;
      default:
        connectionStatus.value = NO_NETWORK;
        break;
      // case ConnectivityResult.none:
      //   connectionStatus.value = 0;
      //   break;
      // default:
      //   Get.snackbar('network_error'.tr, 'network_error_message'.tr);
      //   break;
    }

    return connectionStatus.value;
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
