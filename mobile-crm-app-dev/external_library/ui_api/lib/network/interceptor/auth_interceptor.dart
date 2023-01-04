import 'package:dio/dio.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/services/path_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = options.headers;
    headers.putIfAbsent(Headers.contentTypeHeader, () => 'application/json');
    if (AppDataGlobal.accessToken.isNotEmpty) {
      headers.putIfAbsent(
          'Authorization', () => 'Bearer ${AppDataGlobal.accessToken}');
    }
    // headers.putIfAbsent('cid', () => AppDataGlobal.cid);
    // headers.putIfAbsent('deviceId', () => AppDataGlobal.deviceId);
    // headers.putIfAbsent('deviceName', () => AppDataGlobal.deviceName);
    // headers.putIfAbsent('deviceOS', () => AppDataGlobal.deviceOS);
    // headers.putIfAbsent('osVersion', () => AppDataGlobal.osVersion);
    // headers.putIfAbsent('appVersion', () => AppDataGlobal.appVersion);
    if (AppDataGlobal.cid != -1) {
      headers.putIfAbsent('cid', () => AppDataGlobal.cid);
    }
    headers.putIfAbsent('deviceOs', () => AppDataGlobal.deviceOS);
    headers.putIfAbsent('domain', () => PathService.domain);
    handler.next(options);
  }
  // @override
  // Future onRequest(RequestOptions options) async {
  //   options.headers['Content-Type'] = 'application/json';
  //   options.headers['Client-Key'] = _clientKey;
  //   options.headers['Authorization'] = 'Bearer BEARER_TOKEN1';

  //   final session = SessionPref.getAccessToken();
  //   if (session != null) {
  //     options.headers[ACCESS_TOKEN] = 'Bearer $session';
  //   }
  //   return super.onRequest(options);
  // }
}
