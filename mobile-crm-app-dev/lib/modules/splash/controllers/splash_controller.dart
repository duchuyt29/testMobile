import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ui_api/network/dio_client.dart';
import 'package:ui_api/sicix_api/request/login_request.dart';
import 'package:ui_api/sicix_api/response/domain/domain_info_response.dart';

import '../../../base/base_controller.dart';
import '../../../base/di.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/config/config_environment.dart';
import '../../../routes/sicix_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/services/path_service.dart';
import '../../../shared/services/user_info_service.dart';
import '../../sicix/account/change_language/controller/change_language_controller.dart';

class SplashController extends BaseController {
  final RxBool isLoaded = RxBool(false);
  bool isSetupDomain = false;

  @override
  Future<void> onInit() async {
    await super.onInit();
    await firebaseMessageConfig.initFirebaseMessageConfig();
    await loadInitSplashScreen();

    await AppDataGlobal.loadDeviceInfo();

    Get.log(AppDataGlobal.env);

    await _loadData();
  }

  Future<void> loadInitSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _loadLanguage();
    _loadTheme();
  }

  void _loadLanguage() {
    final language = storage.getString(StorageConstants.language);
    if (language == null) {
      Get.updateLocale(const Locale('vi', 'VN'));
      timeago.setLocaleMessages('vi', CustomTimeagoMessages());
      storage.setString(StorageConstants.language, VIETNAMESE_LANG);
      return;
    }

    if (language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
      timeago.setLocaleMessages('vi', CustomTimeagoMessages());
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      timeago.setLocaleMessages('en', CustomTimeagoMessages());
    }
    AppDataGlobal.languageCode = language == VIETNAMESE_LANG ? 'vi' : 'en';
  }

  void _loadTheme() {
    final theme = storage.getString(StorageConstants.theme);
    if (theme == null || theme == LIGHT_THEME) {
      Get.changeThemeMode(ThemeMode.light);
      storage.setString(StorageConstants.theme, LIGHT_THEME);
      return;
    }

    Get.changeThemeMode(ThemeMode.dark);
    storage.setString(StorageConstants.theme, DARK_THEME);
  }

  Future _loadData() async {
    final domainPath = storage.getString(StorageConstants.DOMAIN) ?? '';
    final apiPath = storage.getString(StorageConstants.API_PATH) ?? '';
    if (domainPath.isEmpty || apiPath.isEmpty) {
      isLoaded.value = true;
      return;
    }

    isSetupDomain = await _callGetConfigDomain(domainPath, apiPath);
    if (isSetupDomain) {
      final isSave = storage.getBool(StorageConstants.IS_SAVE_LOGIN) ?? true;
      final username = storage.getString(StorageConstants.USERNAME) ?? '';
      final password = storage.getString(StorageConstants.PASSWORD) ?? '';
      final accessToken =
          storage.getString(StorageConstants.ACCESS_TOKEN) ?? '';
      final refreshToken =
          storage.getString(StorageConstants.REFRESH_TOKEN) ?? '';

      if (isSave && username.isNotEmpty && password.isNotEmpty) {
        await _callLogin(username, password);
      } else if (isSave && accessToken.isNotEmpty) {
        AppDataGlobal.accessToken = accessToken;
        AppDataGlobal.refreshToken = refreshToken;
        await _callUserConfig();
      }
    }

    isLoaded.value = true;
  }

  /* Action */

  void onNext() {
    if (isSetupDomain) {
      Get.offAndToNamed(SicixRoutes.LOGIN);
    } else {
      Get.offAndToNamed(SicixRoutes.DOMAIN);
    }
  }

  /* API */

  Future<bool> _callGetConfigDomain(String domainPath, String apiPath) async {
    // await storage.setString(StorageConstants.USERNAME, emailController.text);
    printInfo(info: 'Get domain config ${PathService.getConfigPath(apiPath)}');
    try {
      final dio = Dio(DioClient.optionDomain());

      final domain = Uri.parse(domainPath).host;
      final headers = {'deviceOs': AppDataGlobal.deviceOS, 'domain': domain};
      final response = await dio.get(PathService.getConfigPath(apiPath),
          options: Options(headers: headers));
      final dataResponse = DomainInfoResponse.fromJson(response.data);
      if (dataResponse.success) {
        printInfo(
            info: 'Get domain config ${dataResponse.toJson().toString()}');
        PathService.initFromDomainInfo(
          domainInfo: dataResponse.data,
          domain: domain,
          domainPath: domainPath,
          apiPath: apiPath,
        );

        await DependencyInjection.initService();
        return true;
      } else {
        printError(info: 'get domain config ${dataResponse.message ?? ''}');
        return false;
      }
    } on DioError catch (e) {
      printError(info: 'Get domain config DioError ${e.toString()}');
      return false;
    } catch (e) {
      printError(info: 'Get domain config ${e.toString()}');
      return false;
    }
  }

  // Future<bool> _callGetConfigDomainOld(String domain, String apiPath) async {
  //   printInfo(info: 'Get domain config ${PathService.getConfigPath(apiPath)}');
  //   try {
  //     final dio = Dio(DioClient.optionDomain());
  //     final request = DomainConfigRequest(domain);
  //     final response = await dio.post(PathService.getConfigPath(apiPath),
  //         data: request.toJson());
  //     final dataResponse = DomainResponse.fromJson(response.data);
  //     if (dataResponse.success) {
  //       printInfo(
  //           info: 'Get domain config ${dataResponse.toJson().toString()}');
  //       if (dataResponse.data?.config?.apiUrl == null) {
  //         PathService.initFromDomain(domain, apiPath);
  //       } else {
  //         PathService.initFromDomainConfig(
  //             domain, apiPath, dataResponse.data!.config!);
  //       }
  //       await DependencyInjection.initService();
  //       return true;
  //     } else {
  //       printError(info: 'get domain config ${dataResponse.message ?? ''}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     printError(info: 'Get domain config DioError ${e.toString()}');
  //     return false;
  //   } catch (e) {
  //     printError(info: 'Get domain config ${e.toString()}');
  //     return false;
  //   }
  // }

  Future<void> _callLogin(String username, String password) async {
    final request = LoginRequest(username, password);
    await sicixUIRepository.login(request).then((response) async {
      if (response.success && response.data != null) {
        AppDataGlobal.saveLogin(response.data!, password, true);
        await _callUserConfig();
      } else {
        printError(info: response.message ?? '');
      }
    }).catchError((onError) {
      printError(info: onError.toString());
    });
  }

  Future<void> _callUserConfig() async {
    await sicixUIRepository.userConfig().then((response) async {
      if (response.success && response.data != null) {
        AppDataGlobal.saveUserInfo(response.data!);
        if (response.data?.configs?.lastCompanyId == null) {
          await Get.toNamed(SicixRoutes.CHOOSE_COMPANY, arguments: true);
        } else {
          // await _getProfileDetail(response.data?.id ?? '');
          final userInfo = await UserInfoService.getUserProfileCRMFromId(
            response.data?.id ?? '',
            onError: (message) {
              printError(info: message);
              AppDataGlobal.clearUser();
            },
            onMappingError: (message) {
              printError(info: message);
            },
          );
          if (userInfo != null) {
            AppDataGlobal.userInfo = userInfo;
            await Get.offAllNamed(SicixRoutes.MASTER);
          }
        }
      } else {
        printError(info: response.message ?? '');
        AppDataGlobal.clearUser();
        // await Get.offAndToNamed(SicixRoutes.LOGIN, arguments: 'relogin.error'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      AppDataGlobal.clearUser();
      // Get.offAndToNamed(SicixRoutes.LOGIN, arguments: 'relogin.error'.tr);
    });
  }

  // Lấy thông tin profile của user
  // Future _getProfileDetail(String userId) async {
  //   return sicixUIRepository
  //       .getProfile(userId, AppDataGlobal.cid)
  //       .then((response) async {
  //     if (response.success && response.data != null) {
  //       AppDataGlobal.userInfo = response.data;

  //       await _getProfileMapping(userId);
  //     } else {
  //       AppDataGlobal.clearUser();
  //     }
  //   }).catchError((onError) {
  //     printError(info: onError.toString());
  //     isLoaded.value = true;
  //     AppDataGlobal.clearUser();
  //   });
  // }

  // // Mapping từ thông tin user lấy id của employee
  // // Nếu không có thì cho đăng nhập thành công, nếu có tiếp tục lấy thông tin employee
  // Future _getProfileMapping(String userId) async {
  //   return sicixUIRepository.getProfileMapping(userId).then((response) async {
  //     if (response.success) {
  //       if (response.data?.id != null) {
  //         AppDataGlobal.userInfo?.userMapping = response.data;
  //         await _getEmployeeProfile(response.data!.id!);
  //       } else {
  //         await Get.offAllNamed(SicixRoutes.MASTER);
  //       }
  //     } else {
  //       isLoaded.value = true;
  //     }
  //   }).catchError((onError) {
  //     isLoaded.value = true;
  //   });
  // }

  // // Lấy thông tin employee nếu có
  // Future _getEmployeeProfile(int employeeId) async {
  //   return sicixUIRepository
  //       .getEmployeeProfile(employeeId)
  //       .then((response) async {
  //     if (response.success) {
  //       AppDataGlobal.userInfo?.employeeInfo = response.data?.employeeInfo;
  //       await Get.offAllNamed(SicixRoutes.MASTER);
  //     } else {
  //       isLoaded.value = true;
  //     }
  //   }).catchError((onError) {
  //     isLoaded.value = true;
  //   });
  // }
}
