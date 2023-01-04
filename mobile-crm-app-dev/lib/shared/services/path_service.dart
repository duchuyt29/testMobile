import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/sicix_api/models/domain/domain_info.dart';

import '../../data/app_data_global.dart';
import '../../resource/config/config_environment.dart';
import '../constants/common.dart';
import '../constants/storage.dart';

class PathService {
  static String domain = '';
  static String domainPath = '';
  static String apiPath = '';
  static String identityPath = '';
  static String realm = '';

  static String storagePath = '';
  static String mediaPath = '';
  static String wsDomain = '';
  static String forgotPassPath = '';

// domain = https://sicix.vn
// api = https://api.sicix.vn/nspace
// auth-server-url: https://id.sicix.vn/auth
// realm: sicix
// identity: https://id.sicix.vn/auth/realms/sicix/login-actions/reset-credentials?client_id=account-console

  // Domain: 'ngsc.sicix.vn',
  // DomainPath: 'https://ngsc.sicix.vn',
  // APIPath: 'https://api.sicix.vn/nspace',
  // IdentityPath: 'https://id.sicix.vn/auth/realms/ngsc/login-actions/reset-credentials?client_id=account-console',
  // Realm: 'ngsc',
  // WebSocketGraphQLUrl: 'wss://api.sicix.vn/nspace/chat/ws/',
  // MediaPath: 'https://media.sicix.vn/',

  static void initFromConfig() {
    final config = Get.find<EnvConfiguration>();

    PathService.domain = config.value[Domain] ?? '';
    PathService.domainPath = config.value[DomainPath] ?? '';
    PathService.apiPath = config.value[APIPath] ?? '';
  }

  static void initFromDomainInfo({
    DomainInfo? domainInfo,
    required String domain,
    required String domainPath,
    required String apiPath,
  }) {
    final storage = Get.find<SharedPreferences>();
    final config = Get.find<EnvConfiguration>();

    PathService.domain = domain;
    PathService.domainPath = domainPath;

    var api = domainInfo?.url?.api ?? '';
    if (api.lastIndexOf('/') == api.length) {
      api = api.substring(0, api.length - 1);
    }
    if (api.isNotEmpty) {
      PathService.apiPath = api;
    } else {
      PathService.apiPath = apiPath;
    }

    storage.setString(StorageConstants.DOMAIN, PathService.domainPath);
    storage.setString(StorageConstants.API_PATH, PathService.apiPath);

    final realm = domainInfo?.sso?.realm ?? '';
    if (realm.isNotEmpty) {
      PathService.realm = realm;
    } else {
      PathService.realm = config.value[Realm] ?? '';
    }

    var authServerUrl = domainInfo?.sso?.authServerUrl ?? '';
    if (authServerUrl.lastIndexOf('/') == authServerUrl.length) {
      authServerUrl = authServerUrl.substring(0, authServerUrl.length - 1);
    }
    if (authServerUrl.isNotEmpty) {
      PathService.identityPath = authServerUrl;
    } else {
      PathService.identityPath =
          '${domainPath.replaceAll(domain, 'id.$domain')}/auth';
    }

    PathService.storagePath = '${PathService.apiPath}/storage/file/preview';

    final media = domainInfo?.url?.media ?? '';
    if (media.isNotEmpty) {
      PathService.mediaPath = media;
    } else {
      PathService.mediaPath =
          '${domainPath.replaceAll(domain, 'media.$domain')}';
    }

    PathService.forgotPassPath =
        '${PathService.identityPath}/realms/${PathService.realm}/login-actions/reset-credentials?client_id=account-console';

    if (PathService.apiPath.contains('https')) {
      PathService.wsDomain =
          '${PathService.apiPath.replaceFirst('https', 'wss')}/chat/ws/';
    } else {
      PathService.wsDomain =
          '${PathService.apiPath.replaceFirst('http', 'ws')}/chat/ws/';
    }
  }

  // static void initFromDomain(String domainPath, String apiPath) {
  //   final storage = Get.find<SharedPreferences>();

  //   PathService.domainPath = domainPath;
  //   PathService.apiPath = apiPath;

  //   storage.setString(StorageConstants.DOMAIN, PathService.domainPath);
  //   storage.setString(StorageConstants.API_PATH, PathService.apiPath);

  //   PathService.storagePath =
  //       '${PathService.apiPath}/nspace/storage/file/preview/';
  //   PathService.mediaPath = PathService.apiPath.replaceFirst('api', 'media');
  //   PathService.forgotPassPath =
  //       '${PathService.identityPath}/auth/realms/nspace/login-actions/reset-credentials?client_id=account-console';
  // }

  // static void initFromDomainConfig(
  //     String domainPath, String apiPath, DomainItem domainItem) {
  //   final storage = Get.find<SharedPreferences>();

  //   final url = domainItem.url ?? '';
  //   PathService.domainPath = url.isEmpty ? domainPath : url;

  //   final apiUrl = domainItem.apiUrl ?? '';
  //   PathService.apiPath = apiUrl.isEmpty ? apiPath : apiUrl;

  //   storage.setString(StorageConstants.DOMAIN, PathService.domainPath);
  //   storage.setString(StorageConstants.API_PATH, PathService.apiPath);

  //   // final protocol = PathService.domain.substring(0, domainPath.indexOf('://'));

  //   // final identityUrl = domainItem.identityUrl ?? '';
  //   // PathService.identityPath = identityUrl.isEmpty
  //   //     ? domainPath.replaceAll('$protocol://', '$protocol://id.')
  //   //     : identityUrl;

  //   // if (protocol.contains('https')) {
  //   //   PathService.wsDomain =
  //   //       '${PathService.apiPath.replaceAll(protocol, 'wss')}/nspace/chat/ws/';
  //   // } else {
  //   //   PathService.wsDomain =
  //   //       '${PathService.apiPath.replaceAll(protocol, 'ws')}/nspace/chat/ws/';
  //   // }

  //   final identityUrl = domainItem.identityUrl ?? '';
  //   PathService.identityPath = identityUrl.isEmpty
  //       ? PathService.apiPath.replaceFirst('api', 'id')
  //       : identityUrl;
  //   if (PathService.apiPath.contains('https')) {
  //     PathService.wsDomain =
  //         '${PathService.apiPath.replaceFirst('https', 'wss')}/nspace/chat/ws/';
  //   } else {
  //     PathService.wsDomain =
  //         '${PathService.apiPath.replaceFirst('http', 'ws')}/nspace/chat/ws/';
  //   }

  //   PathService.storagePath =
  //       '${PathService.apiPath}/nspace/storage/file/preview/';
  //   PathService.mediaPath = PathService.apiPath.replaceFirst('api', 'media');
  //   PathService.forgotPassPath =
  //       '${PathService.identityPath}/auth/realms/nspace/login-actions/reset-credentials?client_id=account-console';
  // }

  static String getConfigPath(String api) {
    // return '$api/nspace/account/config/companies';
    return '$api/system/domain/vendor?params=url,sso';
  }

  static String chatPath() {
    log('chat path $wsDomain${AppDataGlobal.accessToken}');
    return '$wsDomain${AppDataGlobal.accessToken}';
  }

  static String imagePath(String? id) {
    if (id == null || id.replaceAll(' ', '').isEmpty) {
      return '';
    }
    return '$storagePath/$id?cid=${AppDataGlobal.cid}';
  }

  static String imagePreview(String? id) {
    if (id == null || id.replaceAll(' ', '').isEmpty) {
      return '';
    }
    return '$storagePath/$id-x128?cid=${AppDataGlobal.cid}';
  }

  static String videoPath(String? id) {
    if (id == null || id.replaceAll(' ', '').isEmpty) {
      return '';
    }
    return '$mediaPath/$id?cid=${AppDataGlobal.cid}';
  }

  static String videoPreview(String? id) {
    if (id == null || id.replaceAll(' ', '').isEmpty) {
      return '';
    }
    final preview = '$mediaPath/thumbs/$id.jpg?cid=${AppDataGlobal.cid}';
    return preview;
  }

  static String file(String? id) {
    if (id == null || id.replaceAll(' ', '').isEmpty) {
      return '';
    }
    return '$storagePath/$id?cid=${AppDataGlobal.cid}';
  }

  static String fileDownload(String? id) {
    if (id == null || id.replaceAll(' ', '').isEmpty) {
      return '';
    }
    return '$storagePath/$id?cid=${AppDataGlobal.cid}';
  }
}
