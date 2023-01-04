import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:sicix/data/app_data_global.dart';

import '../../sicix_api/request/refresh_token_request.dart';
import '../../sicix_api/response/auth/token_response.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  static const int unauthorizedTokenCode = 401;
  static const int payloadTooLargeCode = 413;
  static const int badGatewayCode = 502;

  Function() refreshTokenFailure;
  Function() serverUpgrading;

  TokenInterceptor(
    this.dio, {
    required this.refreshTokenFailure,
    required this.serverUpgrading,
  });

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final options = response.requestOptions;
    switch (response.statusCode) {
      case unauthorizedTokenCode:
        try {
          final request = RefreshTokenRequest(AppDataGlobal.refreshToken);
          final response = await dio.post(
              '${dio.options.baseUrl}/account/auth/refresh-token',
              data: request.toJson());
          final dataResponse = TokenResponse.fromJson(response.data);
          if (dataResponse.success && dataResponse.data != null) {
            printInfo(info: 'Refresh token  success');
            AppDataGlobal.refreshLogin(dataResponse.data!);

            options.headers['Authorization'] =
                'Bearer ${AppDataGlobal.accessToken}';
            final opts = Options(method: options.method);
            final response = await dio.request(options.path,
                options: opts,
                cancelToken: options.cancelToken,
                onReceiveProgress: options.onReceiveProgress,
                data: options.data,
                queryParameters: options.queryParameters);
            handler.resolve(response);
          } else {
            printError(info: 'Refresh token ${dataResponse.message ?? ''}');
            refreshTokenFailure();
          }
        } on DioError catch (e) {
          printError(info: 'Refresh token error $e');
          refreshTokenFailure();
        }
        break;
      case payloadTooLargeCode:
        response.data = {'success': false, 'message': 'error.too.large'.tr};
        super.onResponse(response, handler);
        break;
      case badGatewayCode:
        serverUpgrading();
        break;
      default:
        super.onResponse(response, handler);
    }
    // if (response.statusCode == unauthorizedTokenCode) {
    //   try {
    //     final request = RefreshTokenRequest(AppDataGlobal.refreshToken);
    //     final response = await dio.post(
    //         '${dio.options.baseUrl}/nspace/account/auth/refresh-token',
    //         data: request.toJson());
    //     final dataResponse = TokenResponse.fromJson(response.data);
    //     if (dataResponse.success && dataResponse.data != null) {
    //       printInfo(info: 'Refresh token  success');
    //       AppDataGlobal.refreshLogin(dataResponse.data!);

    //       options.headers['Authorization'] =
    //           'Bearer ${AppDataGlobal.accessToken}';
    //       final opts = Options(method: options.method);
    //       final response = await dio.request(options.path,
    //           options: opts,
    //           cancelToken: options.cancelToken,
    //           onReceiveProgress: options.onReceiveProgress,
    //           data: options.data,
    //           queryParameters: options.queryParameters);
    //       handler.resolve(response);
    //     } else {
    //       printError(info: 'Refresh token ${dataResponse.message ?? ''}');
    //       refreshTokenFailure();
    //     }
    //   } on DioError catch (e) {
    //     printError(info: 'Refresh token error $e');
    //     refreshTokenFailure();
    //   }
    // } else if (response.statusCode == 413) {
    //   response.data = {'success': false, 'message': 'error.too.large'.tr};
    //   super.onResponse(response, handler);
    // } else {
    //   super.onResponse(response, handler);
    // }
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final options = err.response?.requestOptions;

    switch (err.response?.statusCode) {
      case unauthorizedTokenCode:
        if (options == null) {
          return;
        }
        try {
          final request = RefreshTokenRequest(AppDataGlobal.refreshToken);
          final response = await dio.post(
              '${dio.options.baseUrl}/xdp/account/auth/refresh-token',
              data: request.toJson());
          final dataResponse = TokenResponse.fromJson(response.data);
          if (dataResponse.data != null) {
            printInfo(info: 'Refresh token  success');
            AppDataGlobal.accessToken = dataResponse.data?.accessToken ?? '';
            AppDataGlobal.refreshToken = dataResponse.data?.refreshToken ?? '';

            options.headers['Authorization'] =
                'Bearer ${AppDataGlobal.accessToken}';
            final opts = Options(method: options.method);
            final response = await dio.request(options.path,
                options: opts,
                cancelToken: options.cancelToken,
                onReceiveProgress: options.onReceiveProgress,
                data: options.data,
                queryParameters: options.queryParameters);
            // await dio.request(options.path, options: options);
            handler.resolve(response);
          } else {
            printError(
                info: 'Refresh token error ${dataResponse.message ?? ''}');
            refreshTokenFailure();
          }
        } on DioError catch (e) {
          printError(info: 'Refresh token error $e');
          refreshTokenFailure();
        }
        break;
      case payloadTooLargeCode:
        // response.data = {'success': false, 'message': 'error.too.large'.tr};
        super.onError(
            DioError(
              requestOptions: err.requestOptions,
              response: err.response,
              error: 'error.too.large'.tr,
            ),
            handler);
        break;
      case badGatewayCode:
        serverUpgrading();
        break;
      default:
        super.onError(err, handler);
    }

    // if (err.response?.statusCode == 401 && options != null) {
    //   try {
    //     final request = RefreshTokenRequest(AppDataGlobal.refreshToken);
    //     final response = await dio.post(
    //         '${dio.options.baseUrl}/nspace/account/auth/refresh-token',
    //         data: request.toJson());
    //     final dataResponse = TokenResponse.fromJson(response.data);
    //     if (dataResponse.data != null) {
    //       printInfo(info: 'Refresh token  success');
    //       AppDataGlobal.accessToken = dataResponse.data?.accessToken ?? '';
    //       AppDataGlobal.refreshToken = dataResponse.data?.refreshToken ?? '';

    //       options.headers['Authorization'] =
    //           'Bearer ${AppDataGlobal.accessToken}';
    //       final opts = Options(method: options.method);
    //       final response = await dio.request(options.path,
    //           options: opts,
    //           cancelToken: options.cancelToken,
    //           onReceiveProgress: options.onReceiveProgress,
    //           data: options.data,
    //           queryParameters: options.queryParameters);
    //       // await dio.request(options.path, options: options);
    //       handler.resolve(response);
    //     } else {
    //       printError(info: 'Refresh token error ${dataResponse.message ?? ''}');
    //       refreshTokenFailure();
    //     }
    //   } on DioError catch (e) {
    //     printError(info: 'Refresh token error $e');
    //     refreshTokenFailure();
    //   }
    // } else {
    //   super.onError(err, handler);
    // }
  }

  // @override
  // void onError(DioError error) {
  //   if (error.response?.statusCode == 401) {
  //     dio.
  //   }
  //   super.onError(error, handler);
  // }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

  //   super.onRequest(options, handler);
  // }

  // @override
  // void onError(DioError error, ErrorInterceptorHandler handler) {
  //   print('[TokenInterceptor] onError ->');

  //   if (error.response?.statusCode == 401) {
  //     print('[TokenInterceptor] onError'
  //         '${error.message}');
  //   }
  //   if (error.response == null || error.type != DioErrorType.response) {
  //     return;
  //   }
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   print('[TokenInterceptor] onResponse ->[${response.statusCode}'
  //       ' ${response.requestOptions.path}] : $response ');

  //   if (unauthorizedTokenCodes.contains(response.statusCode)) {}
  //   return super.onResponse(response, handler);
  // }

}
