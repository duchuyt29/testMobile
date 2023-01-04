import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/instance_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/crm_api/models/activity/activity_condition.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/crm_master_data.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/lead/lead_stage_reason.dart';
import 'package:ui_api/crm_api/models/product/product.dart';
import 'package:ui_api/sicix_api/models/auth/token_model.dart';
import 'package:ui_api/sicix_api/models/auth/user_config/user_config.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';

import '../shared/constants/storage.dart';
import '../shared/services/user_info_service.dart';

class AppDataGlobal {
  // static String imageDomain = '';
  // static String wsDomain = '';

  static String env = '';

  static String firebaseToken = '';
  static String accessToken = '';
  static String refreshToken = '';
  static UserConfig? userConfig;
  static UserInfo? userInfo;
  static CrmMasterData? crmMasterData;
  static List<EmployeeModel> employees = [];
  static List<Product> products = [];
  static Map<int, List<LeadStageReason>> leadStageReasons =
      <int, List<LeadStageReason>>{};
  // static Map<String, ChatUser> contacts = {};
  // static Map<int, Workgroup> workgroups = {};

  static String languageCode = '';
  // static String username = '';
  // static String password = '';
  static bool isLogin = false;

  static int cid = -1;
  static String deviceId = '';
  static String deviceName = '';
  static String deviceOS = '';
  static String osVersion = '12.3.1';
  static String appVersion = '';

  static ActivityCondition activityCondition = ActivityCondition(
    logicOperator: 'AND',
    conditionType: 'GROUP',
    filterType: 'ROLE',
    children: [
      ActivityCondition(
        logicOperator: '',
        conditionType: 'RULE',
        filterType: 'ROLE',
        fieldName: 'RESPONSIBLE',
        values: [userInfo != null ? userInfo!.id : ''],
      ),
      ActivityCondition(
        logicOperator: 'OR',
        conditionType: 'RULE',
        filterType: 'ROLE',
        fieldName: 'REQUESTER',
        values: [userInfo != null ? userInfo!.id : ''],
      ),
      ActivityCondition(
        logicOperator: 'OR',
        conditionType: 'RULE',
        filterType: 'ROLE',
        fieldName: 'create_by',
        values: [
          userInfo != null ? userInfo!.id : '',
        ],
      ),
    ],
  );

  static Future<void> loadDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    deviceOS = Platform.operatingSystem;
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor ?? ''; // unique ID on iOS
      deviceName = iosDeviceInfo.utsname.machine ?? '';
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id ?? ''; // unique ID on Android
      deviceName = androidDeviceInfo.model ?? '';
    }

    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  static void saveLogin(TokenModel data, String password, bool isSave) {
    accessToken = data.accessToken ?? '';
    refreshToken = data.refreshToken ?? '';

    final decodedToken = JwtDecoder.decode(accessToken);
    cid = decodedToken['cid'] ?? -1;

    if (isSave) {
      final storage = Get.find<SharedPreferences>();
      storage.setString(StorageConstants.PASSWORD, password);
      storage.setString(StorageConstants.ACCESS_TOKEN, accessToken);
      storage.setString(StorageConstants.REFRESH_TOKEN, refreshToken);
    }
  }

  static void refreshLogin(TokenModel data) {
    accessToken = data.accessToken ?? '';
    refreshToken = data.refreshToken ?? '';

    final storage = Get.find<SharedPreferences>();
    if (storage.getBool(StorageConstants.IS_SAVE_LOGIN) ?? false) {
      storage.setString(StorageConstants.ACCESS_TOKEN, accessToken);
      storage.setString(StorageConstants.REFRESH_TOKEN, refreshToken);
    }
  }

  static void saveUserInfo(UserConfig userConfig) {
    AppDataGlobal.userConfig = userConfig;
    if (userConfig.configs?.lastCompanyId != null) {
      cid = userConfig.configs!.lastCompanyId!;
    }
  }

  static void saveProfile(UserInfo userInfo) {
    AppDataGlobal.userInfo = userInfo;
    log('Profile: $userInfo');
  }

  static void clearUser() {
    accessToken = '';
    refreshToken = '';
    userConfig = null;
    userInfo = null;
    cid = -1;

    // contacts.clear();
    UserInfoService.chatUserContacts.clear();
    UserInfoService.contacts.clear();
    UserInfoService.workgroups.clear();

    final storage = Get.find<SharedPreferences>();
    storage.setString(StorageConstants.PASSWORD, '');
    storage.setString(StorageConstants.ACCESS_TOKEN, '');
    storage.setString(StorageConstants.REFRESH_TOKEN, '');
  }

  static void saveLanguage(String language) {
    final storage = Get.find<SharedPreferences>();
    storage.setString(StorageConstants.language, language);
  }
}
