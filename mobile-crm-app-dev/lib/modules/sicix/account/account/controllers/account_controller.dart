import 'package:get/get.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';
import 'package:ui_api/sicix_api/request/device_token_request.dart';
import 'package:ui_api/sicix_api/request/refresh_token_request.dart';

import '../../../../../data/app_data_global.dart';
import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../master/controllers/master_controller.dart';

class AccountController extends GetxController {
  final sicixUIRepository = Get.find<SicixUIRepository>();
  final MasterController masterController;

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  final name = RxString(AppDataGlobal.userInfo?.getName() ?? '');
  final avatar = RxString(AppDataGlobal.userInfo?.getAvatar() ?? '');
  final phone = RxString(AppDataGlobal.userInfo?.getPhone() ?? '');

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final language = RxString('language'.tr);

  AccountController(this.masterController);

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
    }
  }

  /* Action */

  Future<void> onViewDetail() async {
    await Get.toNamed(SicixRoutes.PROFILE_DETAIL,
            arguments: AppDataGlobal.userInfo)
        ?.then((value) async {
      name.value = AppDataGlobal.userInfo?.getName() ?? '';
      avatar.value = AppDataGlobal.userInfo?.getAvatar() ?? '';
      phone.value = AppDataGlobal.userInfo?.getPhone() ?? '';
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.update.profile.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
  }

  Future<void> onEdit() async {
    await Get.toNamed(SicixRoutes.EDIT_PROFILE,
            arguments: AppDataGlobal.userInfo)
        ?.then((value) async {
      name.value = AppDataGlobal.userInfo?.getName() ?? '';
      avatar.value = AppDataGlobal.userInfo?.getAvatar() ?? '';
      phone.value = AppDataGlobal.userInfo?.getPhone() ?? '';
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.update.profile.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
  }

  Future<void> onChangePassword() async {
    // notificationMessage.value = await Get.toNamed(SicixRoutes.CHANGE_PASSWORD);
    // log('Turn On/Off: ${isTurnOnOffNotification.value}');
    // if (notificationMessage.value != '') {
    //   isUpdateNotification.value = true;
    //   await Future.delayed(const Duration(milliseconds: 5000)).then((value) {
    //     isUpdateNotification.value = false;
    //   });
    // }

    await Get.toNamed(SicixRoutes.CHANGE_PASSWORD)?.then((value) async {
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.change.password.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
    // if (notificationMessage.value != '') {
    //   isUpdateNotification.value = true;
    //   await Future.delayed(const Duration(milliseconds: 5000)).then((value) {
    //     isUpdateNotification.value = false;
    //   });
    // }
  }

  Future<void> onChangeCompany() async {
    await Get.toNamed(SicixRoutes.CHOOSE_COMPANY)?.then((value) {
      if (value is bool && value) {
        companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      }
    });
  }

  Future<void> onNotificationChanged(bool value) async {
    isNotification.value = true;
    isBlueNotification.value = true;
    notificationMessage.value = value
        ? 'turn_on.all_notifications'.tr
        : 'turn_off.all_notifications'.tr;
    await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      isNotification.value = false;
      notificationMessage.value = '';
    });

    // content: controller.notificationMessage.value != ''
    //                   ? controller.notificationMessage.value
    //                   : controller.isNotification.value
    //                       ? 'turn_on.all_notifications'.tr
    //                       : 'turn_off.all_notifications'.tr,
  }

  Future<void> onChangeLanguage() async {
    await Get.toNamed(SicixRoutes.CHANGE_LANGUAGE)?.then((value) {
      language.value = 'language'.tr;
    });
  }

  Future<void> onLogout() async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'logout.confirm'.tr,
      confirmTitle: 'logout.title'.tr,
      onConfirm: () async {
        await _callDeleteDeviceToken();
        await _callLogout();
      },
    );
  }

  /* API */

  // Future<void> getProfileDetail() async {
  //   await sicixUIRepository
  //       .getProfile(AppDataGlobal.userConfig?.id ?? '', AppDataGlobal.cid)
  //       .then((response) {
  //     if (response.success && response.data != null) {
  //       name.value = response.data?.fullName ?? '';
  //       phone.value = response.data?.phone ?? '';
  //       if (response.data!.avatar != null) {
  //         avatar.value = response.data?.getAvatar() ?? '';
  //       }
  //       AppDataGlobal.saveProfile(response.data!);
  //     }
  //   });
  // }

  Future<void> _callDeleteDeviceToken() async {
    final request = DeviceTokenRequest.request();
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

  Future<void> _callLogout() async {
    final request = RefreshTokenRequest(AppDataGlobal.refreshToken);
    await sicixUIRepository.logout(request).then((response) async {
      printInfo(info: 'logout');
    }).catchError(
      (onError) {
        printError(info: 'logout error ${onError.toString()}');
      },
    );

    AppDataGlobal.clearUser();

    await Get.offAllNamed(SicixRoutes.LOGIN);
  }
}
