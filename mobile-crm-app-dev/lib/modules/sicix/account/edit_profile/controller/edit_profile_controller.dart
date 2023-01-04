import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/request/update_profile_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../resource/assets_constant/icon_constants.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/utils/focus.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_confirm.dart';
import '../../../../../shared/widgets/choose_datetime_widget.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';

class EditProfileController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final UserInfo userInfo;
  DateTime? birthday;

  RxnString errorName = RxnString(null);
  RxnString errorPhone = RxnString(null);
  RxnString errorBirthday = RxnString(null);

  RxnString notification = RxnString(null);
  RxnString avatar = RxnString(null);
  String source =
      '[0-9a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽếềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵýỷỹ\\s]';

  EditProfileController(this.userInfo);

  @override
  Future<void> onInit() async {
    await super.onInit();

    emailController.text = userInfo.email ?? '';
    nameController.text = userInfo.fullName ?? '';
    usernameController.text = userInfo.username ?? '';
    phoneController.text = userInfo.phone ?? '';
    birthday = userInfo.birthDate;
    birthdayController.text = DateUtil.formatDatetimeToString(birthday);
  }

  /* Action */

  Future<void> onChange() async {
    AppFocus.unFocus();

    errorName.value = validatorName(nameController.text);
    errorPhone.value = validatorPhone(phoneController.text);

    if (errorName.value == null &&
        errorPhone.value == null &&
        errorBirthday.value == null) {
      final request = UpdateProfileRequest(
        companyId: userInfo.companyId,
        email: userInfo.email,
        birthDate: birthday,
      );
      final result = nameController.text.split(' ');
      request.lastName = result[0];
      result.removeAt(0);
      if (result.isNotEmpty) {
        request.firstName = result[result.length - 1];
        result.removeAt(result.length - 1);
      }
      if (result.isNotEmpty) {
        request.middleName = result.join(' ');
      }
      request.phone = phoneController.text;
      await showDialogConfirm(request);
    }
  }

  void onChooseBirthday() {
    DialogUtil.showDialogDatePicker(
      ChooseDateTimeWidget(
        birthDay: birthday,
        onClose: Get.back,
      ),
      (value) {
        if (value != null && value is DateTime) {
          birthdayController.text = DateUtil.formatDatetimeToString(value);
          if (value.compareTo(DateTime.now()) == 0 ||
              value.compareTo(DateTime.now()) == 1) {
            errorBirthday.value = 'account.change_profile.birthday_invalid'.tr;
          } else {
            birthday = value;
            errorBirthday.value = null;
          }
        }
      },
    );
  }

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

  /*  Function */

  Future<void> showDialogConfirm(UpdateProfileRequest request) async {
    await Get.bottomSheet(
      WidgetConfirm(
        title: 'account.change_profile.update.title'.tr,
        message: 'account.change_profile.update.message'.tr,
        onAccept: () {
          Get.back();
          _callUpdateProfile(request);
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
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
                avatar.value = AppDataGlobal.userInfo?.getAvatar();
              }
            });
          }
        });
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

  Future<void> showDialogChooseImage() async {
    await Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: AppColor.canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 38.0,
                height: 3.0,
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: AppColor.neutral8,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  'avatar'.tr,
                  style: AppTextStyle.heavy(),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: Get.back,
                  child: FCoreImage(IconConstants.iconClose),
                ),
              ],
            ),
            const SizedBox(
              height: 36.0,
            ),
            InkWell(
              onTap: () async {
                await requestPermission(Permission.storage);
              },
              child: Text(
                'change.profile.choose_device'.tr,
                style: AppTextStyle.heavy(
                  fontSize: 18.0,
                  color: AppColor.blackColor,
                ),
              ),
            ),
            const SizedBox(
              height: 33.0,
            ),
          ],
        ),
      ),
    );
  }

  String? validatorName(String? email) {
    if (email?.isEmpty ?? true) {
      errorName.value = 'account.change.profile.input_data.empty'.tr;
    } else {
      errorName.value = null;
    }
    return errorName.value;
  }

  String? validatorPhone(String? phone) {
    if (phone?.isEmpty ?? true) {
      errorPhone.value = 'account.change.profile.input_data.empty'.tr;
    } else if (phone!.length != 10) {
      errorPhone.value = 'account.change_profile.error.phone.invalid'.tr;
    } else if (!GetUtils.isPhoneNumber(phoneController.text)) {
      errorPhone.value = 'account.change_profile.error.phone.invalid'.tr;
    } else {
      errorPhone.value = null;
    }
    return errorPhone.value;
  }

  /* API */

  Future<void> _callUpdateProfile(UpdateProfileRequest request) async {
    await EasyLoading.show();
    await sicixUIRepository
        .updateProfile(request, AppDataGlobal.userConfig?.id ?? '')
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data != null) {
        AppDataGlobal.saveProfile(response.data!);
        Get.back<UserInfo>(
          result: response.data,
          closeOverlays: true,
        );
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError(
      (onError) {
        printError(info: onError.toString());
        DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'notify.error'.tr,
        );
      },
    );
  }

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
