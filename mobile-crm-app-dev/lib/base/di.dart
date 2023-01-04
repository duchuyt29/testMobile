import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_api/crm_api/datasource/crm_ui_api.dart';
import 'package:ui_api/crm_api/repository/crm_api_repository.dart';
import 'package:ui_api/crm_api/repository/impl/crm_api_repository_impl.dart';
import 'package:ui_api/network/dio_client.dart';
import 'package:ui_api/network/http_overrides.dart';
import 'package:ui_api/sicix_api/datasource/sicix_ui_api.dart';
import 'package:ui_api/sicix_api/repository/impl/sicix_ui_repository_impl.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

import '../data/app_data_global.dart';
import '../data/hive_database/dao/image_cache_dao.dart';
import '../data/hive_database/hive_database.dart';
import '../routes/sicix_pages.dart';
import '../shared/constants/arguments.dart';
import '../shared/services/config_service.dart';
import '../shared/services/locator_service.dart';
import '../shared/services/path_service.dart';
import '../shared/services/storage_service.dart';

class DependencyInjection {
  static Future init(String environment) async {
    HttpOverrides.global = MyHttpOverrides();

    await ConfigService().init(environment);

    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => LocateService().init());

    PathService.initFromConfig();

    // UI api
    final _dioUIAPI = await DioClient.setup(
      baseUrl: PathService.apiPath,
      refreshTokenFailure: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN, arguments: MESSAGE_UNAUTHORIZED);
        }
      },
      serverUpgrading: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN,
              arguments: MESSAGE_SERVICE_UPGRADING);
        }
      },
    );
    final uiAPI = SicixUIAPI(_dioUIAPI);
    final SicixUIRepository uiRepo = SicixUIRepositoryImpl(uiAPI);
    Get.put(uiRepo);

    // CRM api
    final _dioCRM = await DioClient.setupCrm(
      baseUrl: PathService.apiPath,
      refreshTokenFailure: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN, arguments: MESSAGE_UNAUTHORIZED);
        }
      },
      serverUpgrading: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN,
              arguments: MESSAGE_SERVICE_UPGRADING);
        }
      },
    );
    final crmApi = CrmUIAPI(_dioCRM);
    final CrmApiRepository crmRepo = CrmApiRepositoryImpl(crmApi);
    Get.put(crmRepo);

    //For cahe Image
    final dir = await getApplicationDocumentsDirectory();
    final _hive = HiveDatabase(dir.path);
    await _hive.init();
    Get.put(ImageCacheDAO(_hive.imageCacheBox), permanent: true);
  }

  static Future<void> initService() async {
    await Get.delete<SicixUIRepository>(force: true);
    await Get.delete<CrmApiRepository>(force: true);

    // UI api
    final _dioUIAPI = await DioClient.setup(
      baseUrl: PathService.apiPath,
      refreshTokenFailure: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN, arguments: MESSAGE_UNAUTHORIZED);
        }
      },
      serverUpgrading: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN,
              arguments: MESSAGE_SERVICE_UPGRADING);
        }
      },
    );
    final uiAPI = SicixUIAPI(_dioUIAPI);
    final SicixUIRepository uiRepo = SicixUIRepositoryImpl(uiAPI);
    Get.put(uiRepo, permanent: true);

    // CRM api
    final _dioCRM = await DioClient.setupCrm(
      baseUrl: PathService.apiPath,
      refreshTokenFailure: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN, arguments: MESSAGE_UNAUTHORIZED);
        }
      },
      serverUpgrading: () {
        AppDataGlobal.clearUser();
        if (Get.currentRoute != SicixRoutes.LOGIN) {
          Get.offAllNamed(SicixRoutes.LOGIN,
              arguments: MESSAGE_SERVICE_UPGRADING);
        }
      },
    );
    final crmApi = CrmUIAPI(_dioCRM);
    final CrmApiRepository crmRepo = CrmApiRepositoryImpl(crmApi);
    Get.put(crmRepo, permanent: true);
  }
}
