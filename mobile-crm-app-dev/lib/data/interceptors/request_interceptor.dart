import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(Request request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  await EasyLoading.show(
    status: '${'Loading'.tr}...',
    indicator: const Icon(
      Icons.hourglass_bottom,
      size: 25,
      color: Color(0xFF4CAF50),
    ),
  );
  return request;
}
