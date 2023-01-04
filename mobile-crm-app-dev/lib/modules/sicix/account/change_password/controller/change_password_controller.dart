import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/request/device_token_request.dart';
import 'package:ui_api/sicix_api/request/update_password_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/storage.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_confirm.dart';

class ChangePasswordController extends BaseController {
  TextEditingController currentPaswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypeNewPasswordController = TextEditingController();

  RxString errorCurrentPassword = RxString('');
  RxString errorNewPassword = RxString('');
  RxString errorRetypePassword = RxString('');

  RxBool hideCurrentPassword = RxBool(true);
  RxBool hideNewPassword = RxBool(true);
  RxBool hideInputPassword = RxBool(true);

  /* Action */
  Future<void> onChangePassword() async {
    final password = currentPaswordController.text.replaceAll(' ', '');
    if (password.isEmpty) {
      errorCurrentPassword.value = 'change.password.input.empty'.tr;
    } else if (password.length < 6 || password.length > 32) {
      errorCurrentPassword.value = 'change.password.input.validate'.tr;
    } else {
      errorCurrentPassword.value = '';
    }

    final newPassword = newPasswordController.text.replaceAll(' ', '');
    if (newPassword.isEmpty) {
      errorNewPassword.value = 'change.password.input.empty'.tr;
    } else if (newPassword.length < 6 || newPassword.length > 32) {
      errorNewPassword.value = 'change.password.input.validate'.tr;
    } else if (newPassword == password) {
      errorNewPassword.value = 'change.password.input.duplicate'.tr;
    } else {
      errorNewPassword.value = '';
    }

    final retypePassword = retypeNewPasswordController.text.replaceAll(' ', '');
    if (retypePassword.isEmpty) {
      errorRetypePassword.value = 'change.password.input.empty'.tr;
    } else if (retypePassword.length < 6 || retypePassword.length > 32) {
      errorRetypePassword.value = 'change.password.input.validate'.tr;
    } else if (newPassword != retypePassword) {
      errorRetypePassword.value = 'change.password.input.password.invalid'.tr;
    } else {
      errorRetypePassword.value = '';
    }

    if (errorCurrentPassword.value.isEmpty &&
        errorNewPassword.value.isEmpty &&
        errorRetypePassword.value.isEmpty) {
      await showDialogConfirm(password, newPassword);
    }
  }

  /* Function */

  // String validatorCurrentPassword(String? password) {
  //   if (password?.isEmpty ?? true) {
  //     errorCurrentPassword.value = 'change.password.input.empty'.tr;
  //   } else {
  //     if (currentPaswordController.text
  //             .compareTo(storage.getString(StorageConstants.PASSWORD)!) !=
  //         0) {
  //       errorCurrentPassword.value =
  //           'change.password.current.password.invalid'.tr;
  //     } else {
  //       errorCurrentPassword.value = '';
  //     }
  //   }
  //   return errorCurrentPassword.value;
  // }

  // String validatorNewPassword(String? password) {
  //   if (password?.isEmpty ?? true) {
  //     errorNewPassword.value = 'change.password.input.empty'.tr;
  //   } else {
  //     if (password!.length < 6 || password.length > 32) {
  //       errorNewPassword.value = 'note'.tr;
  //     } else if (password
  //             .compareTo(storage.getString(StorageConstants.PASSWORD)!) ==
  //         0) {
  //       errorNewPassword.value = 'change.password.new.password.invalid'.tr;
  //     } else {
  //       errorNewPassword.value = '';
  //     }
  //   }
  //   return errorNewPassword.value;
  // }

  // String validatorInputPassword(String? password) {
  //   if (password?.isEmpty ?? true) {
  //     errorRetypePassword.value = 'change.password.input.empty'.tr;
  //   } else {
  //     if (password != newPasswordController.text) {
  //       errorRetypePassword.value = 'change.password.input.password.invalid'.tr;
  //     } else {
  //       errorRetypePassword.value = '';
  //     }
  //   }
  //   return errorRetypePassword.value;
  // }

  void resetInput(TextEditingController controller) {
    controller.clear();
  }

  Future<void> showDialogConfirm(String oldPassword, String newPassword) async {
    await Get.bottomSheet(
      WidgetConfirm(
        title: 'change.password.confirm.title'.tr,
        message: 'change.password.confirm.subtitle'.tr,
        onAccept: () {
          Get.back();
          changePassword(oldPassword, newPassword);
        },
        onCancel: Get.back,
      ),
      ignoreSafeArea: true,
    );
  }

  /* API */

  Future<void> changePassword(String oldPassword, String newPassword) async {
    final request = UpdatePasswordRequest(
        id: AppDataGlobal.userConfig?.id,
        oldPassword: oldPassword,
        password: newPassword);

    await EasyLoading.show();
    await sicixUIRepository.updatePassword(request).then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data) {
        // if (storage.getBool(StorageConstants.IS_SAVE_LOGIN) ?? true) {
        //   await storage.setString(StorageConstants.PASSWORD, request.password!);
        // }

        // Get.back(result: true);
        await _callDeleteDeviceToken();
        AppDataGlobal.clearUser();
        await DialogUtil.createDialogMessage(
            title: 'change.password.success'.tr,
            message: 'change.password.success.cap'.tr,
            textButton: 'login.title'.tr,
            onPressed: () {
              Get.offAllNamed(SicixRoutes.LOGIN);
            });
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callDeleteDeviceToken() async {
    final request = DeviceTokenRequest(
      deviceToken: AppDataGlobal.firebaseToken,
      deviceId: AppDataGlobal.deviceId,
      deviceOS: AppDataGlobal.deviceOS,
      osVersion: AppDataGlobal.osVersion,
      deviceName: AppDataGlobal.deviceName,
      appVersion: AppDataGlobal.appVersion,
    );
    await sicixUIRepository.deleteToken(request, 0).then((response) async {
      if (response.success) {
        printInfo(info: 'delete token success');
      } else {
        printError(
            info: 'delete token failure ${response.message ?? 'unknow'}');
      }
    }).catchError((onError) {
      printError(info: 'delete token failure ${onError.toString()}');
    });
  }
}
