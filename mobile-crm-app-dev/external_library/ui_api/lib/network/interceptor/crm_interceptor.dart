import 'package:dio/dio.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/constants/common.dart';

class CrmInterceptor extends Interceptor {
  CrmInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = options.headers;

    if (AppDataGlobal.env == DEV_ENVIRONMENT) {
      headers.putIfAbsent('uid', () => AppDataGlobal.userInfo?.id ?? '');
      headers.putIfAbsent('key', () => 'test');
    }

    headers.putIfAbsent(
        'isAdmin', () => AppDataGlobal.userInfo?.employeeInfo?.isAdmin ?? 0);
    headers.putIfAbsent(
        'employeeId',
        () => AppDataGlobal.env == DEV_ENVIRONMENT
            ? '2'
            : AppDataGlobal.userInfo?.employeeInfo?.id.toString());
    headers.putIfAbsent('Accept-Language', () => AppDataGlobal.languageCode);

    headers.putIfAbsent(
        'allowEmployeeIds',
        () =>
            AppDataGlobal.userInfo?.employeeInfo?.allowEmployeeIds?.join(',') ??
            '');
    handler.next(options);
  }
}
