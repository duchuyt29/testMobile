import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_crop/image_crop.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ChangeAvatarController extends BaseController {
  final cropKey = GlobalKey<CropState>();
  final image = Rxn<File>();

  @override
  Future<void> onInit() async {
    await super.onInit();

    final imageFile = Get.arguments;
    if (imageFile != null && imageFile is File) {
      image.value = Get.arguments;
      await ImageCrop.getImageOptions(file: imageFile);
      // .then((result) {
      //   final imageWidth = result.width;
      //   final imageHeight = result.height;
      //   imageRatio.value = imageWidth / imageHeight;
      // });
    } else {
      Get.back();
    }
    // final File? file = Get.arguments;
    // if (file != null) {
    //   image.value = file;
    //   await ImageCrop.getImageOptions(file: file).then((result) {
    //     final imageWidth = result.width;
    //     final imageHeight = result.height;
    //     imageRatio.value = imageWidth / imageHeight;
    //   });
  }

  /* Action */

  Future<void> handleCompletedButtonPressed() async {
    if (cropKey.currentState != null) {
      final croppedFile = await ImageCrop.cropImage(
        file: image.value!,
        area: cropKey.currentState!.area!,
      );
      await _changeAvatar(croppedFile);
    }
  }

  /* API */
  Future<void> _changeAvatar(File file) async {
    await EasyLoading.show();
    await sicixUIRepository.changeAvatar(file).then((response) async {
      if (response.success) {
        await _getUserInfo(response.avatarModel);
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _getUserInfo(UserInfo? user) async {
    await sicixUIRepository.getProfile(user?.id ?? '').then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.userInfo = response.data;
        Get.back(result: true);
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
