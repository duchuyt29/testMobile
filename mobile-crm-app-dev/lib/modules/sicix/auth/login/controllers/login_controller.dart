import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/request/device_token_request.dart';
import 'package:ui_api/sicix_api/request/login_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/storage.dart';
import '../../../../../shared/services/path_service.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/utils/focus.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_contact_admin.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_forgot_password.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_setup_domain.dart';

class LoginController extends BaseController {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isShowPassword = RxBool(false);
  final RxBool isSaveLogin = RxBool(false);

  final RxString errorEmail = RxString('');
  final RxString errorPassword = RxString('');

  int _loginCount = 0;

  @override
  Future<void> onInit() async {
    isSaveLogin.value = storage.getBool(StorageConstants.IS_SAVE_LOGIN) ?? true;
    emailController.text = storage.getString(StorageConstants.USERNAME) ?? '';

    await super.onInit();

    final messageCode = Get.arguments ?? '';
    switch (messageCode) {
      case MESSAGE_UNAUTHORIZED:
        await EasyLoading.showToast('error.expires'.tr);
        break;
      case MESSAGE_SERVICE_UPGRADING:
        await DialogUtil.createDialogMessage(
          title: 'notify.server.upgrading.title'.tr,
          message: 'notify.server.upgrading.message'.tr,
        );
        break;
      default:
    }
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  /* Function */

  String? validatorEmail(String? email) {
    if (errorEmail.isNotEmpty) {
      return errorEmail.value;
    } else if (email == null || email.isEmpty) {
      errorEmail.value = 'login.input.email.empty'.tr;
    }
    return errorEmail.value.isEmpty ? null : '';
  }

  String? validatorPass(String? password) {
    if (errorPassword.isNotEmpty) {
      return errorPassword.value;
    } else if (password == null || password.isEmpty) {
      errorPassword.value = 'login.input.pass.empty'.tr;
    } else if (password.length < 6) {
      errorPassword.value = 'login.input.pass.validate'.tr;
    }
    return errorPassword.value.isEmpty ? null : '';
  }

  /* Action */

  void onLogin() {
    AppFocus.unFocus();

    errorEmail.value = '';
    errorPassword.value = '';
    if (formGlobalKey.currentState != null &&
        formGlobalKey.currentState!.validate()) {
      _callLogin();
    }
  }

  void onSavePassword() {
    isSaveLogin.value = !isSaveLogin.value;
    storage.setBool(StorageConstants.IS_SAVE_LOGIN, isSaveLogin.value);
  }

  Future<void> onForgotPassword() async {
    await BottomSheetUtil.createBottomSheet(
      child: const WidgetForgotPassword(),
    );
  }

  Future<void> _loginFailure(String? message) async {
    await EasyLoading.dismiss();
    if (_loginCount >= 3) {
      _loginCount = 0;
      await BottomSheetUtil.createBottomSheet(
        child: WidgetSetupDomain(PathService.domainPath),
      );
    } else {
      await BottomSheetUtil.createBottomSheet(
        child: WidgetContactAdmin(
          title: 'notify.title'.tr,
          message: message ?? 'notify.error'.tr,
        ),
      );
    }
  }

  /* API */

  Future<void> _callLogin() async {
    _loginCount++;
    await storage.setString(StorageConstants.USERNAME, emailController.text);

    final loginRequest =
        LoginRequest(emailController.text, passwordController.text);
    await EasyLoading.show();
    await sicixUIRepository.login(loginRequest).then((response) async {
      if (response.success && response.data != null) {
        AppDataGlobal.saveLogin(
            response.data!, passwordController.text, isSaveLogin.value);
        await _callUserConfig();
      } else {
        printError(info: 'Login error ${response.message ?? ''}');
        await _loginFailure(response.message);
      }
    }).catchError((onError) {
      printError(info: 'Login error ${onError.toString()}');
      _loginFailure(null);
    });
  }

  // Lấy thông tin cấu hình user có danh sách company
  // Nếu chưa chọn company thì cho chọn, nếu đã chọn thì lấy Profile
  Future<void> _callUserConfig() async {
    await sicixUIRepository.userConfig().then((response) async {
      if (response.success && response.data != null) {
        AppDataGlobal.saveUserInfo(response.data!);
        if (response.data?.configs?.lastCompanyId != null) {
          // await _getProfileDetail(response.data!.id ?? '');

          final userInfo = await UserInfoService.getUserProfileCRMFromId(
            response.data?.id ?? '',
            isCache: false,
            onError: (message) {
              printError(info: message);
              AppDataGlobal.clearUser();
              BottomSheetUtil.createBottomSheet(
                child: WidgetContactAdmin(
                  title: 'notify.title'.tr,
                  message: response.message ?? 'notify.error'.tr,
                ),
              );
            },
            onMappingError: (message) {
              printError(info: message);
              // AppDataGlobal.clearUser();
              // BottomSheetUtil.createBottomSheet(
              //   child: WidgetContactAdmin(
              //     title: 'notify.title'.tr,
              //     message: response.message ?? 'notify.error'.tr,
              //   ),
              // );
            },
          );
          await EasyLoading.dismiss();
          if (userInfo != null) {
            AppDataGlobal.userInfo = userInfo;
          }
          _updateDeviceToken();
          await Get.offAndToNamed(SicixRoutes.MASTER);
        } else {
          await EasyLoading.dismiss();
          await Get.toNamed(SicixRoutes.CHOOSE_COMPANY, arguments: true);
        }
      } else {
        await EasyLoading.dismiss();
        await BottomSheetUtil.createBottomSheet(
          child: WidgetContactAdmin(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr,
          ),
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      BottomSheetUtil.createBottomSheet(
        child: WidgetContactAdmin(
          title: 'notify.title'.tr,
          message: 'notify.error'.tr,
        ),
      );
    });
  }

  void _updateDeviceToken() {
    final request = DeviceTokenRequest(
      deviceToken: AppDataGlobal.firebaseToken,
      deviceId: AppDataGlobal.deviceId,
      deviceOS: AppDataGlobal.deviceOS,
      osVersion: AppDataGlobal.osVersion,
      deviceName: AppDataGlobal.deviceName,
      appVersion: AppDataGlobal.appVersion,
    );
    sicixUIRepository.updateToken(request).then((response) {
      if (response.success) {
        printInfo(info: 'update token success');
      } else {
        printError(
            info: 'update token failure ${response.message ?? 'unknow'}');
      }
    }).catchError((onError) {
      printError(info: 'update token failure ${onError.toString()}');
    });
  }
}
