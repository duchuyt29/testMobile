import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/repository/crm_api_repository.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/models/workgroup/workgroup.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

class UserInfoService {
  static Map<String, ChatUser> chatUserContacts = {};
  static Map<String, UserInfo> contacts = {};
  static Map<int, Workgroup> workgroups = {};

  static Future<UserInfo?> getUserProfileCRMFromId(
    String userId, {
    bool isCache = true,
    bool isCatcheError = false,
    required Function(String) onError,
    required Function(String) onMappingError,
  }) async {
    final sicixUIRepository = Get.find<SicixUIRepository>();
    final crmApiRepository = Get.find<CrmApiRepository>();
    var userInfo = contacts[userId];
    if (isCache && userInfo != null) {
      if (userInfo.isLoadedEmployeeInfo) {
        return userInfo;
      }
    } else {
      userInfo =
          await getUserProfile(sicixUIRepository, userId, onError: onError);
    }
    if (userInfo == null) {
      return null;
    }

    await _getEmployeeProfileCRM(crmApiRepository, userInfo, onMappingError);
    if (userInfo.userMapping?.id == null) {
      contacts[userId] = userInfo;
      return userInfo;
    }
    return userInfo;
  }

  static Future<UserInfo?> getUserProfileHCMFromId(
    String userId, {
    bool isCache = true,
    bool isCatcheError = false,
    required Function(String) onError,
    required Function(String) onMappingError,
  }) async {
    final sicixUIRepository = Get.find<SicixUIRepository>();
    var userInfo = contacts[userId];
    if (isCache && userInfo != null) {
      if (userInfo.isLoadedEmployeeInfo) {
        return userInfo;
      }
    } else {
      userInfo =
          await getUserProfile(sicixUIRepository, userId, onError: onError);
    }
    if (userInfo == null) {
      return null;
    }

    await _getProfileMapping(sicixUIRepository, userInfo, onMappingError);
    if (userInfo.userMapping?.id == null) {
      contacts[userId] = userInfo;
      return userInfo;
    }

    await _getEmployeeProfileFromHCM(
        sicixUIRepository, userInfo, userInfo.userMapping!.id!, onMappingError);
    contacts[userId] = userInfo;
    return userInfo;
  }

  // Lấy thông tin profile của user
  static Future<UserInfo?> getUserProfile(
      SicixUIRepository sicixUIRepository, String userId,
      {required Function(String) onError}) async {
    return sicixUIRepository.getProfile(userId).then((response) async {
      if (response.success && response.data != null) {
        return response.data;
      } else if (!response.success) {
        onError(response.message ?? 'notify.error'.tr);
        return null;
      } else {
        onError('error.no.data'.tr);
        return null;
      }
    }).catchError((onError) {
      onError('notify.error'.tr);
      return null;
    });
  }

  // Lấy thông tin employee từ user id
  static Future _getEmployeeProfileCRM(
    CrmApiRepository crmApiRepository,
    UserInfo userInfo,
    Function(String) onMappingError,
  ) async {
    return crmApiRepository
        .getEmployeeProfile(userInfo.id ?? '')
        .then((response) async {
      if (response.success) {
        userInfo.employeeInfo = response.data;
        userInfo.isLoadedEmployeeInfo = true;
      } else {
        onMappingError(response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      onMappingError(onError.toString());
    });
  }

  // Mapping từ thông tin user lấy id của employee. Nếu không có thì cho đăng
  // nhập thành công, nếu có tiếp tục lấy thông tin employee
  static Future _getProfileMapping(
    SicixUIRepository sicixUIRepository,
    UserInfo userInfo,
    Function(String) onMappingError,
  ) async {
    return sicixUIRepository
        .getProfileMappingFromHCM(userInfo.id ?? '')
        .then((response) async {
      if (response.success) {
        userInfo.userMapping = response.data;
        userInfo.isLoadedEmployeeInfo = true;
      } else {
        onMappingError(response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      onMappingError(onError.toString());
    });
  }

  // Lấy thông tin employee nếu có
  static Future _getEmployeeProfileFromHCM(
    SicixUIRepository sicixUIRepository,
    UserInfo userInfo,
    int employeeId,
    Function(String) onMappingError,
  ) async {
    return sicixUIRepository
        .getEmployeeProfileFromHCM(employeeId)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        userInfo.employeeInfoHCM = response.data?.employeeInfoHCM;
      } else {
        onMappingError(response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      onMappingError(onError.toString());
    });
  }

  static Future<Workgroup?> getWorkgroup(int? workgroupId) async {
    if (workgroupId == null) {
      return null;
    }
    if (workgroups[workgroupId] != null) {
      return workgroups[workgroupId];
    }

    final sicixUIRepository = Get.find<SicixUIRepository>();
    return sicixUIRepository.postWorkgroup(workgroupId).then((response) async {
      if (response.success) {
        if (response.data != null) {
          workgroups[workgroupId] = response.data!;
        }
        return response.data;
      } else {
        debugPrint(
            '[UserInfoService] getWorkgroup $workgroupId ${response.message ?? 'error'}');
        return null;
      }
    }).catchError((onError) {
      debugPrint(
          '[UserInfoService] getWorkgroup $workgroupId ${onError.toString()}');
      return null;
    });
  }
}
