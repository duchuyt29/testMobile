import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/auth/user_config/company.dart';
import 'package:ui_api/sicix_api/request/change_company_request.dart';
import 'package:ui_api/sicix_api/request/device_token_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_contact_admin.dart';

class ChooseCompanyController extends BaseController {
  final bool isLogin;

  final companies = RxList(AppDataGlobal.userConfig?.companies ?? []);
  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());

  ChooseCompanyController(this.isLogin);

  @override
  Future<void> onInit() async {
    await super.onInit();

    companySelected.value ??= companies.first;
  }

  /* Action */

  void onChooseCompany(Company company) {
    if (companySelected.value == company) {
      return;
    }
    companySelected.value = company;
  }

  Future<void> onComplete() async {
    if (AppDataGlobal.userConfig?.getLastCompany() == companySelected.value) {
      await Get.offAllNamed(SicixRoutes.MASTER);
    } else if (companySelected.value?.id == null) {
      await BottomSheetUtil.createBottomSheet(
        child: WidgetContactAdmin(
          title: 'notify.title'.tr,
          message: 'choose.company.empty'.tr,
        ),
      );
    } else {
      await _changeCompany(companySelected.value!.id!);
    }
  }

  void onCancel() {
    if (isLogin) {
      AppDataGlobal.clearUser();
    }
    Get.back();
  }

  /* Function */
  void _changeCompanySuccess() {
    _updateDeviceToken();
    if (isLogin) {
      Get.offAndToNamed(SicixRoutes.MASTER, arguments: true);
    } else {
      Get.back(result: true);
    }
  }

  /* API */

  Future<void> _changeCompany(int companyId) async {
    await EasyLoading.show();
    await sicixUIRepository
        .changeCompany(ChangeCompanyRequest(companyId))
        .then((response) async {
      if (response.success) {
        await _callUserConfig();
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

  Future<void> _callUserConfig() async {
    await sicixUIRepository.userConfig().then((response) async {
      if (response.success && response.data != null) {
        AppDataGlobal.saveUserInfo(response.data!);
        // await _getProfileDetail(response.data?.id ?? '');
        final userInfo = await UserInfoService.getUserProfileCRMFromId(
          response.data?.id ?? '',
          isCache: false,
          onError: (message) {
            printError(info: message);
          },
          onMappingError: (message) {
            printError(info: message);
          },
        );
        await EasyLoading.dismiss();
        if (userInfo != null) {
          AppDataGlobal.userInfo = userInfo;
        }
        _changeCompanySuccess();
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

  // // Lấy thông tin profile của user
  // Future _getProfileDetail(String userId) async {
  //   return sicixUIRepository
  //       .getProfile(userId, AppDataGlobal.cid)
  //       .then((response) async {
  //     if (response.success && response.data != null) {
  //       AppDataGlobal.userInfo = response.data;
  //       await _getProfileMapping(userId);
  //     } else {
  //       await EasyLoading.dismiss();
  //       await BottomSheetUtil.createBottomSheet(
  //         child: WidgetContactAdmin(
  //           title: 'notify.title'.tr,
  //           message: response.message ?? 'notify.error'.tr,
  //         ),
  //       );
  //     }
  //   }).catchError((onError) {
  //     EasyLoading.dismiss();
  //     BottomSheetUtil.createBottomSheet(
  //       child: WidgetContactAdmin(
  //         title: 'notify.title'.tr,
  //         message: 'notify.error'.tr,
  //       ),
  //     );
  //   });
  // }

  // // Mapping từ thông tin user lấy id của employee
  // // Nếu không có thì cho đăng nhập thành công, nếu có tiếp tục lấy thông tin employee
  // Future _getProfileMapping(String userId) async {
  //   return sicixUIRepository.getProfileMapping(userId).then((response) async {
  //     if (response.success) {
  //       if (response.data?.id != null) {
  //         AppDataGlobal.userInfo?.userMapping = response.data;
  //         await _getEmployeeProfile(response.data!.id!);
  //       } else {
  //         await EasyLoading.dismiss();
  //         _changeCompanySuccess();
  //       }
  //     } else {
  //       await EasyLoading.dismiss();
  //       await BottomSheetUtil.createBottomSheet(
  //         child: WidgetContactAdmin(
  //           title: 'notify.title'.tr,
  //           message: response.message ?? 'notify.error'.tr,
  //         ),
  //       );
  //     }
  //   }).catchError((onError) {
  //     EasyLoading.dismiss();
  //     BottomSheetUtil.createBottomSheet(
  //       child: WidgetContactAdmin(
  //         title: 'notify.title'.tr,
  //         message: 'notify.error'.tr,
  //       ),
  //     );
  //   });
  // }

  // // Lấy thông tin employee nếu có
  // Future _getEmployeeProfile(int employeeId) async {
  //   return sicixUIRepository
  //       .getEmployeeProfile(employeeId)
  //       .then((response) async {
  //     await EasyLoading.dismiss();
  //     if (response.success) {
  //       AppDataGlobal.userInfo?.employeeInfo = response.data?.employeeInfo;
  //       await EasyLoading.dismiss();
  //       _changeCompanySuccess();
  //     } else {
  //       await EasyLoading.dismiss();
  //       await BottomSheetUtil.createBottomSheet(
  //         child: WidgetContactAdmin(
  //           title: 'notify.title'.tr,
  //           message: response.message ?? 'notify.error'.tr,
  //         ),
  //       );
  //     }
  //   }).catchError((onError) {
  //     EasyLoading.dismiss();
  //     BottomSheetUtil.createBottomSheet(
  //       child: WidgetContactAdmin(
  //         title: 'notify.title'.tr,
  //         message: 'notify.error'.tr,
  //       ),
  //     );
  //   });
  // }

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
