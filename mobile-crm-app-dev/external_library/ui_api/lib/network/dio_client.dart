import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'interceptor/auth_interceptor.dart';
import 'interceptor/crm_interceptor.dart';
import 'interceptor/logger_interceptor.dart';
import 'interceptor/token_interceptor.dart';
// import 'interceptor/token_interceptor.dart';

class DioClient {
  static late Dio _dio;
  static FutureOr<Dio> setup({
    required String baseUrl,
    required Function() refreshTokenFailure,
    required Function() serverUpgrading,
  }) async {
    _dio = Dio(options(baseUrl));

    /// Unified add authentication request header
    _dio.interceptors.add(AuthInterceptor());

    _dio.interceptors.add(TokenInterceptor(_dio,
        refreshTokenFailure: refreshTokenFailure,
        serverUpgrading: serverUpgrading));
    // TokenInterceptor(_dio,
    //     refreshTokenFailure: () =>
    //         Get.offAllNamed(Routes.LOGIN, arguments: 'error.expires'.tr),
    //     serverUpgrading: () {}),

    // Add log in debugmode
    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }

    /// Adapt data (according to your own data structure
    /// , you can choose to add it)
    // _dio.interceptors.add(TokenInterceptor(_dio));

    return _dio;
  }

  static FutureOr<Dio> setupCrm({
    required String baseUrl,
    required Function() refreshTokenFailure,
    required Function() serverUpgrading,
  }) async {
    _dio = Dio(options(baseUrl));

    /// Unified add authentication request header
    _dio.interceptors.add(AuthInterceptor());

    _dio.interceptors.add(TokenInterceptor(_dio,
        refreshTokenFailure: refreshTokenFailure,
        serverUpgrading: serverUpgrading));
    _dio.interceptors.add(CrmInterceptor());

    // Add log in debugmode
    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }

    /// Adapt data (according to your own data structure
    /// , you can choose to add it)
    // _dio.interceptors.add(TokenInterceptor(_dio));

    return _dio;
  }

  static Dio get dio => _dio;

  static BaseOptions options(String baseUrl) => BaseOptions(
        responseType: ResponseType.json,
        validateStatus: (status) {
          return true;
        },
        baseUrl: baseUrl,
        receiveTimeout: 30000, // 30s
        sendTimeout: 30000, // 30s
      );

  static BaseOptions optionDomain() => BaseOptions(
        responseType: ResponseType.json,
        connectTimeout: 10000, // 10s
        receiveTimeout: 5000, // 5s
        sendTimeout: 10000, // 10s
      );
}
