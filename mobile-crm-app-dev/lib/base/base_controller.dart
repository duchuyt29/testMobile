import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/crm_api/repository/crm_api_repository.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

import '../data/app_data_global.dart';
import '../data/interceptors/listen_error_graphql_interceptor.dart';
import '../shared/dialog_manager/data_models/request/common_dialog_request.dart';
import '../shared/network/constants/constants.dart';
import '../shared/network/controllers/network_controller.dart';
import '../shared/network/managers/network_manager.dart';
import '../shared/services/firebase_cloud_messaging.dart';
import '../shared/utils/dialog_util.dart';

class BaseController extends FullLifeCycleController
    with FullLifeCycleMixin, NetworkManager, ListenErrorGraphQL {
  final _networkController = Get.find<NetworkController>();
  final sicixUIRepository = Get.find<SicixUIRepository>();
  final crmUIRepository = Get.find<CrmApiRepository>();
  final storage = Get.find<SharedPreferences>();
  final crmMasterData = AppDataGlobal.crmMasterData;

  final firebaseMessageConfig = FirebaseMessageConfig();

  BuildContext? dialogErrorNetworkContext;
  var _hasNetwork = true;

  @override
  Future<void> onInit() async {
    super.onInit();

    // check network
    await checkConnectNetwork();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  Future<void> onResumed() async {
    // check network
    await checkConnectNetwork();
  }

  Future<void> checkConnectNetwork() async {
    await _updateConnectNetwork(_networkController.connectionStatus.value);
    _networkController.connectionStatus.listen(_updateConnectNetwork);
  }

  Future _updateConnectNetwork(int status) async {
    if (status == NO_NETWORK) {
      if (_hasNetwork) {
        _hasNetwork = false;
        await _callDialogErrorNetwork();
      }
    } else {
      _hasNetwork = true;
      if (dialogErrorNetworkContext != null) {
        Navigator.of(dialogErrorNetworkContext!, rootNavigator: true).pop();
        dialogErrorNetworkContext = null;
      }
    }
  }

  Future<void> _callDialogErrorNetwork() async {
    if (dialogErrorNetworkContext == null) {
      dialogErrorNetworkContext = Get.context!;
      await DialogUtil.createDialogMessage(
        context: dialogErrorNetworkContext,
        title: 'notify.title'.tr,
        message: 'notify.network.error'.tr,
        onPressed: () async {
          dialogErrorNetworkContext = null;
          final status = await _networkController.checkConnectivity();
          await _updateConnectNetwork(status);
        },
      );
    }
  }

  CommonDialogRequest handleErrorResponse(Object e) {
    return handleErrorGraphQLResponse(e);
  }
}
