import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String prettyJsonStr(Map<dynamic, dynamic> json) {
  final encoder = JsonEncoder.withIndent('  ', (data) => data.toString());
  return encoder.convert(json);
}

class LoggerInterceptor extends Interceptor {
  final Function(DioError)? onRequestError;
  //For case response data is too large, dont need to show on log
  final bool Function(Response)? ignoreReponseDataLog;

  LoggerInterceptor({
    this.onRequestError,
    this.ignoreReponseDataLog,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onRequest',
      'Time': DateTime.now().toString(),
      'baseUrl': options.baseUrl,
      'path': options.path,
      'headers': options.headers,
      'method': options.method,
      'requestData': options.data,
      'queryParameters': options.queryParameters.toString(),
    }));

    // try {
    //   log('------ BEGIN REQUEST ------');
    //   log(options.toCurlCmd());
    //   log('------ END REQUEST ------');
    // } catch (e) {
    //   log('Create CURL failure!! - $e');
    // }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onResponse',
      'Time': DateTime.now().toString(),
      'statusCode': response.statusCode,
      'baseUrl': response.requestOptions.baseUrl,
      'path': response.requestOptions.path,
      'method': response.requestOptions.method,
      // 'header': response.requestOptions.headers,
      if (ignoreReponseDataLog?.call(response) != false)
        'responseData': response.data.toString(),
    }));

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onError',
      'Time': DateTime.now().toString(),
      'baseUrl': error.requestOptions.baseUrl,
      // 'header': error.requestOptions.headers,
      'path': error.requestOptions.path,
      'type': error.type,
      'message': error.message,
      'statusCode': error.response?.statusCode,
      'error': error.error,
      'responseData': error.requestOptions.data
    }));
    super.onError(error, handler);
  }
}

extension Curl on RequestOptions {
  String toCurlCmd() {
    var cmd = 'curl';

    final header = headers
        .map((key, value) {
          if (key == 'content-type' &&
              value.toString().contains('multipart/form-data')) {
            value = 'multipart/form-data;';
          }
          return MapEntry(key, '-H "$key: $value"');
        })
        .values
        .join(' ');
    var url = '$baseUrl$path';
    if (queryParameters.isNotEmpty) {
      final query = queryParameters
          .map((key, value) {
            return MapEntry(key, '$key=$value');
          })
          .values
          .join('&');

      url += (url.contains('?')) ? query : '?$query';
    }
    if (method == 'GET') {
      cmd += ' $header "$url"';
    } else {
      final files = <String, dynamic>{};
      var postData = '-d ' '';
      if (data != null) {
        if (data is FormData) {
          final fdata = data as FormData;
          fdata.files.forEach((element) {
            final file = element.value;
            files[element.key] = '@${file.filename}';
          });
          fdata.fields.forEach((element) {
            files[element.key] = element.value;
          });
          if (files.isNotEmpty) {
            postData = files
                .map((key, value) => MapEntry(key, '-F "$key=$value"'))
                .values
                .join(' ');
          }
        } else if (data is Map<String, dynamic>) {
          files.addAll(data);

          if (files.isNotEmpty) {
            postData = '-d "${json.encode(files).toString()}"';
          }
        }
      }

      final method = this.method.toString();
      cmd += ' -X $method $postData $header "$url"';
    }

    return cmd;
  }
}
