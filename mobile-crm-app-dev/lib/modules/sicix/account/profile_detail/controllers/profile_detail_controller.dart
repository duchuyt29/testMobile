import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ProfileDetailController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final userInfo = Rx(AppDataGlobal.userInfo);

  RxnString notification = RxnString(null);
  RxnString avatar = RxnString(null);

  ProfileDetailController();

  @override
  Future<void> onInit() async {
    await super.onInit();

    emailController.text = userInfo.value?.getEmail() ?? '';
    nameController.text = userInfo.value?.getName() ?? '';
    usernameController.text = userInfo.value?.username ?? '';
    phoneController.text = userInfo.value?.getPhone() ?? '';
    birthdayController.text =
        DateUtil.formatDatetimeToString(userInfo.value?.getBirthday());
  }

  /* Action */

  Future onRemoveAccount() async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'remove.account'.tr,
      message: 'remove.account.cap'.tr,
      confirmTitle: 'remove.account'.tr,
      onConfirm: () async {
        await _callRemoveAccount();
      },
    );
  }

  Future<void> onChangeAvatar() async {
    final status = await Permission.storage.request();
    switch (status) {
      case PermissionStatus.granted:
        await Get.toNamed(SicixRoutes.IMAGE_PICKER, arguments: true)
            ?.then((file) {
          if (file != null && file is File) {
            Get.toNamed(SicixRoutes.CHANGE_AVATAR, arguments: file)
                ?.then((value) {
              if (value != null && value is bool && value) {
                notification.value = 'notification.change.avatar.success'.tr;
                Future.delayed(const Duration(milliseconds: 3000))
                    .then((value) {
                  notification.value = null;
                });
                userInfo.value = AppDataGlobal.userInfo;
              }
            });
          }
        });
        // await Get.toNamed(SicixRoutes.CHOOSE_IMAGE)?.then((value) {
        //   userInfo.value = AppDataGlobal.userInfo;
        // });
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        break;
      case PermissionStatus.limited:
        break;
      case PermissionStatus.permanentlyDenied:
        break;
    }
  }

  /* API */

  Future<void> _callRemoveAccount() async {
    final userId = AppDataGlobal.userInfo?.id;
    if (userId == null) {
      return;
    }

    await EasyLoading.show();
    await sicixUIRepository.removeAccount(userId).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.clearUser();
        await Get.offAllNamed(SicixRoutes.LOGIN,
            arguments: 'remove.accoun.success'.tr);
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }
}
